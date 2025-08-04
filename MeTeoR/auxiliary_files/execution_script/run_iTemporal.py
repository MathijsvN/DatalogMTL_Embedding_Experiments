import sys
import os

# Add the MeTeoR project root to sys.path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "../..")))

# Now import the correct loader
from meteor_reasoner.utils.loader import load_dataset, load_program

from meteor_reasoner.materialization.materialize import *
# from meteor_reasoner.utils.loader import load_dataset, load_program


def run_MeTeoR_reasoner(input_data, input_program, output_path) :

    with open(input_data) as file:
        data = file.readlines()
    with open(input_program) as file:
        program = file.readlines()

    D = load_dataset(data)
    D_index = build_index(D)
    rules = load_program(program)
    for i in range(1,5):
        print("Iteration:", i)
        print("=====================")
        # print("Before D:")
        # print_dataset(D)
        print("Derived facts:")
        delta_new = naive_immediate_consequence_operator(rules, D, D_index)
        print_dataset(delta_new)
        # print("After D:")
        materialize(D, rules, K=1)
        # print_dataset(D)

    print(type(D))

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Run MeTeoR reasoner on given data and program.")
    parser.add_argument("--input_data", required=True, help="Path to data file.")
    parser.add_argument("--input_program", required=True, help="Path to program file.")
    parser.add_argument("--output", default="datalog_output.txt", help="Output file name.")

    args = parser.parse_args()

    run_MeTeoR_reasoner(args.input_data, args.input_program, args.output)

