import re

def normalize_vars(args):
    return [f"?{arg.strip()}" for arg in args.split(',')]

def parse_datalogmtl_program_txt_file(input_file):
    with open(input_file, 'r') as f:
        lines = [line.strip() for line in f if line.strip() and not line.strip().startswith('%')]
    print(lines)

    rules = []
    rule_counter = 0

    for line in lines:
        if ':-' not in line:
            continue

        head, body = line.split(':-')
        print(line)
        head = head.strip()
        body_atoms = smart_split_atoms(body)

        rule_counter += 1
        rules.append(f"% Rule {rule_counter}.")

        head_line, head_vars = get_head_line(head)
        body_lines, constraints = get_body_lines(body_atoms)

        rules.append(f"{head_line}")
        rules.append("    :-  " + ",\n        ".join(body_lines + constraints) + ".")

    return rules

def get_head_line(head):
    temporal_match = re.match(r'(Boxplus|Boxminus|Diamondplus|Diamondminus)\[(\d+),(\d+)\]\s*(\w+)\(([^)]+)\)', head)
    non_temporal_match = re.match(r'(\w+)\(([^)]+)\)', head)

    if temporal_match:
        _, _, _, pred, args = temporal_match.groups()
    elif non_temporal_match:
        pred, args = non_temporal_match.groups()
    else:
        raise ValueError(f"Invalid head format: {head}")

    args = normalize_vars(args)
    return f"{pred}({', '.join(args)}, ?start, ?end)", args

def get_body_lines(body_atoms):
    body_lines = []
    constraints = []
    time_vars = []

    for i, atom in enumerate(body_atoms):
        temporal_match = re.match(r'(Boxplus|Boxminus|Diamondplus|Diamondminus)\[(\d+),(\d+)\]\s*(\w+)\(([^)]+)\)', atom)
        non_temporal_match = re.match(r'(\w+)\(([^)]+)\)', atom)

        start_var = f"?start{i+1}"
        end_var = f"?end{i+1}"

        if temporal_match:
            op, a, b, pred, args = temporal_match.groups()
            args = normalize_vars(args)
            body_lines.append(f"{pred}({', '.join(args)}, {start_var}, {end_var})")

            if op == 'Boxplus':
                constraints.append(f"?start = max({start_var})")
                constraints.append(f"?end = min({end_var} - {b})")
            elif op == 'Boxminus':
                constraints.append(f"?start = max({start_var} + {b})")
                constraints.append(f"?end = min({end_var} + {a})")
            elif op == 'Diamondplus':
                constraints.append(f"?start = max({start_var} - {b})")
                constraints.append(f"?end = min({end_var})")
            elif op == 'Diamondminus':
                constraints.append(f"?start = max({start_var} + {a})")
                constraints.append(f"?end = min({end_var} + {b})")
        elif non_temporal_match:
            pred, args = non_temporal_match.groups()
            args = normalize_vars(args)
            body_lines.append(f"{pred}({', '.join(args)}, {start_var}, {end_var})")
            time_vars.append((start_var, end_var))

    if not constraints and time_vars:
        starts = ', '.join(s for s, _ in time_vars)
        ends = ', '.join(e for _, e in time_vars)
        constraints.append(f"?start = max({starts})")
        constraints.append(f"?end = min({ends})")

    constraints.append("?start <= ?end")
    return body_lines, constraints

def smart_split_atoms(body):
    result = []
    current = []
    depth = 0

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

