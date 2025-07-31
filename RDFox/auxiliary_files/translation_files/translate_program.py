import re
from translate_data import concatenate_arguments

def parse_datalogmtl_program_txt_file(input_file):
    with open(input_file, 'r') as f:
        lines = [line.strip() for line in f if line.strip() and not line.strip().startswith('%')]

    rules = [ "@prefix : <http://example.org/> ." ]
    rule_counter = 0

    for line in lines:
        if ':-' not in line:
            continue

        head, body = line.split(':-')
        head = head.strip()
        body_atoms = smart_split_atoms(body)

        head_match = re.match(r'(\w+)\(([^)]+)\)', head)
        if not head_match:
            # if not temporal_match = re.match(r'(Boxplus|Boxminus)\[(\d+),(\d+)\]\s*(\w+)\(([^)]+)\)', atom)
            continue
        head_pred, head_vars = head_match.groups()
        head_vars = [v.strip() for v in head_vars.split(',')]

        rule_lines_head = []
        rule_lines_body = []
        create_arguments_node = False
        rule_lines_head.append(f"# Rule {rule_counter + 1}")

        if len(head_vars) == 2 :
            # Binary head predicate
            rule_lines_head.append(f"[ ?{head_vars[0]}, :{head_pred}, ?newInterval ],")
            rule_lines_head.append(f"[ ?newInterval, :{head_pred}, ?{head_vars[1]}],")
            rule_lines_head.append(f"[ ?newInterval, :from, ?start],")
            rule_lines_head.append(f"[ ?newInterval, :to, ?end],")
            rule_lines_head.append(f"[ ?newInterval, a, :Interval] :-")
        
        elif len (head_vars) == 1 :
            # Unary head predicate
            rule_lines_head.append(f"[ ?{head_vars[0]}, :unaryPred, ?newInterval ],")
            rule_lines_head.append(f"[ ?newInterval, :unaryPred, :{head_pred}],")
            rule_lines_head.append(f"[ ?newInterval, :from, ?start],")
            rule_lines_head.append(f"[ ?newInterval, :to, ?end],")
            rule_lines_head.append(f"[ ?newInterval, a, :Interval] :-")

        elif len(head_vars) > 2 :
            # N-ary head predicate
            for i in range(len(head_vars)) :
                var = head_vars[i]
                new_rule_line = f"[ ?{var}, :argument_{i+1}_of, ?head_arguments ],"
                rule_lines_head.append(new_rule_line)

            rule_lines_head.append(f"[ ?head_arguments, :nAryPred, ?newInterval ],")
            rule_lines_head.append(f"[ ?newInterval, :nAryPred, :{head_pred}],")
            rule_lines_head.append(f"[ ?newInterval, :from, ?start],")
            rule_lines_head.append(f"[ ?newInterval, :to, ?end],")
            rule_lines_head.append(f"[ ?newInterval, a, :Interval] :-")

            # make a new node using SKOLEM
            new_head_argument_node = f'SKOLEM ( "n-ary parameters", { ", ".join( [ f"?{var}" for var in head_vars ] ) }, ?head_arguments ),'
            create_arguments_node = True

        bind_starts = []
        bind_ends = []
        interval_index = 1

        for atom in body_atoms:
            # print(atom)
            temporal_match = re.match(r'(Boxplus|Boxminus|Diamondplus|Diamondminus)\[(\d+),(\d+)\]\s*(\w+)\(([^)]+)\)', atom)
            # binary_match = re.match(r'(\w+)\(([^,]+),([^)]+)\)', atom)
            binary_match = re.match(r'^(\w+)\(([^,()]+),([^,()]+)\)$', atom) # binary, non n-ary
            # unary_match = re.match(r'(\w+)\(([^)]+)\)', atom)
            unary_match = re.match(r'^(\w+)\(([^,()]+)\)$', atom)
            n_ary_match = re.match(r'(\w+)\(([^)]+,[^,]+,[^)]+(?:,[^)]+)*)\)', atom)

            # print(f"{temporal_match} --- {binary_match} --- {unary_match} --- {n_ary_match}")

            if temporal_match:
                op, a, b, pred, args = temporal_match.groups() # script assumes Normal form (i.e. no nested temporal operators)
                args = [arg.strip() for arg in args.split(',')]
                
                if len(args) == 2 :
                    # Binary predicate
                    s, o = args[0], args[1]
                    rule_lines_body.extend( body_binary_atom(pred, s, o, interval_index) )
                    
                elif len(args) == 1 :
                    # Unary predicate 
                    s = args[0]
                    rule_lines_body.extend(body_unary_atom(pred, s, interval_index) )
                elif len(args) > 2 :
                    rule_lines_body.extend(body_nAry_atom(pred, args, interval_index))


                if op == 'Boxplus':
                    bind_starts.append(f"?start{interval_index} - {a}")
                    bind_ends.append(f"?end{interval_index} - {b}")
                if op == 'Boxminus':
                    bind_starts.append(f"?start{interval_index} + {b}")
                    bind_ends.append(f"?end{interval_index} + {a}")
                elif op == 'Diamondplus':
                    bind_starts.append(f"?start{interval_index} - {b}")
                    bind_ends.append(f"?end{interval_index} - {a}")
                elif op == 'Diamondminus':
                    bind_starts.append(f"?start{interval_index} + {a}")
                    bind_ends.append(f"?end{interval_index} + {b}")
                interval_index += 1

            elif binary_match:
                pred, s, o = binary_match.groups()
                rule_lines_body.extend( body_binary_atom(pred, s, o, interval_index) )
                bind_starts.append(f"?start{interval_index}")
                bind_ends.append(f"?end{interval_index}")
                interval_index += 1

            elif unary_match:
                pred, s = unary_match.groups()
                rule_lines_body.extend( body_unary_atom(pred, s, interval_index) )
                bind_starts.append(f"?start{interval_index}")
                bind_ends.append(f"?end{interval_index}")
                interval_index += 1

            elif n_ary_match :
                # print(f"in {input_file}")
                # print(f"Rule {rule_counter}, body atom {atom} is an n-ary match")
                # N-ary predicate
                pred, args = n_ary_match.groups()
                args = [arg.strip() for arg in args.split(',')]
                rule_lines_body.extend(body_nAry_atom(pred, args, interval_index))
                
                bind_starts.append(f"?start{interval_index}")
                bind_ends.append(f"?end{interval_index}")
                interval_index += 1


        rule_lines_body.append(f"BIND ( MAXFN( {", ".join(bind_starts)} ) AS ?start ),")
        rule_lines_body.append(f"BIND ( MINFN( {", ".join(bind_ends)} ) AS ?end ),")
        rule_lines_body.append(f'SKOLEM ( "Time interval", ?start, ?end, ?newInterval ),')
        if create_arguments_node :
            rule_lines_body.append(new_head_argument_node)

        rule_lines_body.append(f"FILTER( ?start <= ?end ).\n")

        rules.append('\n'.join(rule_lines_head))
        rules.append('\n'.join( "       " + line for line in rule_lines_body ))
        rule_counter += 1
    return rules

def body_binary_atom(pred, s, o, interval_index) :
    rule_lines = []
    rule_lines.append(f"[ ?{s}, :{pred}, ?interval{interval_index} ],")
    rule_lines.append(f"[ ?interval{interval_index}, :{pred}, ?{o}],")
    rule_lines.append(f"[ ?interval{interval_index}, a, :Interval],")
    rule_lines.append(f"[ ?interval{interval_index}, :from, ?start{interval_index}],")
    rule_lines.append(f"[ ?interval{interval_index}, :to, ?end{interval_index}],")
    return rule_lines

def body_unary_atom(pred, s, interval_index) :
    rule_lines = []
    rule_lines.append(f"[ ?{s}, :unaryPred, ?interval{interval_index} ],")
    rule_lines.append(f"[ ?interval{interval_index}, :unaryPred, :{pred}],")
    rule_lines.append(f"[ ?interval{interval_index}, a, :Interval],")
    rule_lines.append(f"[ ?interval{interval_index}, :from, ?start{interval_index}],")
    rule_lines.append(f"[ ?interval{interval_index}, :to, ?end{interval_index}],")
    return rule_lines

def body_nAry_atom(pred, args, interval_index) :
    n = len(args)
    rule_lines = [ f"[ :{pred}, :hasArity, {n} ],"]

    for i in range(n):
        arg = args[i]
        rule_lines.append( f" [ ?{arg}, :argument_{i+1}_of , ?joinedArgument ]," )
    
    rule_lines.append(f"[ ?joinedArgument, :nAryPred, ?interval{interval_index} ],")
    rule_lines.append(f"[ ?interval{interval_index}, :nAryPred, :{pred}],")
    rule_lines.append(f"[ ?interval{interval_index}, a, :Interval],")
    rule_lines.append(f"[ ?interval{interval_index}, :from, ?start{interval_index}],")
    rule_lines.append(f"[ ?interval{interval_index}, :to, ?end{interval_index}],")
    return rule_lines
                
def smart_split_atoms(body):
    result = []
    current = []
    depth = 0
    body = body.rstrip(".")

    for char in body:
        if char in '([{':
            depth += 1
        elif char in ')]}':
            depth -= 1
        if char == ',' and depth == 0:
            result.append(''.join(current).strip())
            current = []
        else:
            current.append(char)

    if current:
        result.append(''.join(current).strip())

    return result




if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Parse DatalogMTL txt program file .")
    parser.add_argument("--input", required=True, help="Path to txt file.")
    parser.add_argument("--output", default="program_output.dlog", help="Output file name.")

    args = parser.parse_args()

    rules = parse_datalogmtl_program_txt_file(args.input)
    with open(args.output, "w") as f:
        for rule in rules:
            f.write(rule + "\n")

    print(f"Datalog rules written to {args.output}")

