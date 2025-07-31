import csv
import os
from glob import glob

def parse_datalog_csv_files(input_folder):
    interval_counter = 0
    datalog_facts = [ "@prefix : <http://example.org/> ."] # Start with defining the : prefix

    # Get all CSV files in the folder
    csv_files = glob(os.path.join(input_folder, "*.csv"))

    for file_path in sorted(csv_files):
        predicate = os.path.splitext(os.path.basename(file_path))[0]
        predicate = predicate.replace("_numeric", "")
        print(predicate)

        with open(file_path, newline='') as csvfile:
            reader = csv.reader(csvfile)
            headers = next(reader)  

            if len(headers) == 3 :
                # Unary Predicate
                new_facts, interval_counter = parse_unary_data(reader, predicate, interval_counter)
            elif len(headers) == 4 : 
                # Binary Predicate
                new_facts, interval_counter = parse_binary_data(reader, predicate, interval_counter)
            elif len(headers) > 4 :
                new_facts, interval_counter = parse_n_ary_data(reader, predicate, interval_counter, len(headers) - 2)
            else :
                continue


            datalog_facts.extend( new_facts )
            interval_counter += 1

    return datalog_facts

def parse_unary_data(reader, predicate, intervalcounter) :
    facts = [ f":{predicate} a :UnaryPredicate .", "" ]
    for row in reader :
        x, a, b = row

        # fact = f"{predicate}({x})@[{a}, {b}]"
        fact1 = f"{transform_parameter(x)} :unaryPred :interval_{intervalcounter} ."
        fact2 = f":interval_{intervalcounter} :unaryPred :{predicate};"
        fact3 = f"      :from {a} ;"
        fact4 = f"      :to {b} ;"
        fact5 = f"      a :Interval."

        facts.extend( [fact1, fact2, fact3, fact4, fact5, ""] )
        intervalcounter += 1
    return facts, intervalcounter

def parse_binary_data(reader, predicate, intervalcounter) :
    facts = [ f":{predicate} a :BinaryPredicate .", "" ]
    # print(f"Adding predicate data of {predicate}")
    for row in reader :
        x, y, a, b = row
        # fact = f"{predicate}({x},{y})@[{a}, {b}]"
        fact1 = f"{transform_parameter(x)} :{predicate} :interval_{intervalcounter} ."
        fact2 = f":interval_{intervalcounter} :{predicate} {transform_parameter(y)};"
        fact3 = f"      :from {a} ;"
        fact4 = f"      :to {b} ;"
        fact5 = f"      a :Interval."

        facts.extend( [fact1, fact2, fact3, fact4, fact5, ""] )
        intervalcounter += 1
    return facts, intervalcounter

def parse_n_ary_data(reader, predicate, intervalcounter,n) :
    facts = [ f":{predicate} :hasArity {n}.", "" ]
    for row in reader :
        a = row[-2]
        b = row[-1]
        arguments = row[:-2]
        joined_argument = concatenate_arguments(arguments)
        for i in range(len(arguments)) :
            arg = arguments[i]
            new_fact = f"{transform_parameter(arg)} :argument_{i+1}_of :{joined_argument} ."
            facts.append(new_fact)

        fact1 = f":{joined_argument} :nAryPred :interval_{intervalcounter} ."
        fact2 = f":interval_{intervalcounter} :nAryPred :{predicate};"
        fact3 = f"      :from {a} ;"
        fact4 = f"      :to {b} ;"
        fact5 = f"      a :Interval."

        facts.extend( [fact1, fact2, fact3, fact4, fact5, ""] )
        intervalcounter += 1
    return facts, intervalcounter    

def concatenate_arguments(arguments) :
    return "arguments_"+ "_".join(arguments)

def transform_parameter(x) :
    try : 
        float(x)
        return f":entity_{x}"
    except :
        return f":{x}"


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Parse DatalogMTL CSV files.")
    parser.add_argument("--input", required=True, help="Path to the folder containing CSV files.")
    parser.add_argument("--output", default="datalog_output.txt", help="Output file name.")

    args = parser.parse_args()

    facts = parse_datalog_csv_files(args.input)
    with open(args.output, "w") as f:
        for fact in facts:
            f.write(fact + "\n")

    print(f"Datalog facts written to {args.output}")

