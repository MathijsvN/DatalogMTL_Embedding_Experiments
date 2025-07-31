import csv
import os
from glob import glob

def parse_datalog_csv_files(input_folder):
    datalogmtl_facts = []

    # Get all CSV files in the folder
    csv_files = glob(os.path.join(input_folder, "*.csv"))

    for file_path in sorted(csv_files):
        predicate = os.path.splitext(os.path.basename(file_path))[0]
        print(predicate)
        print(file_path)
        with open(file_path, newline='') as csvfile:
            reader = csv.reader(csvfile)
            headers = next(reader) 

            for row in reader : 
                interval_bounds = row[-2:]
                arguments = ", ".join(row[:-2])
                new_fact = f"{predicate}({ arguments })@[{interval_bounds[0]}, {interval_bounds[1]}]"
                datalogmtl_facts.append( new_fact )

    return datalogmtl_facts
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

    print(f"DatalogMTL facts written to {args.output}")

