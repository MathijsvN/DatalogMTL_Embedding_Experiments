import csv
import os
import numpy as np
from glob import glob
import csv

def parse_datalog_csv_files(input_folder, output_folder):

    # Get all CSV files in the folder
    csv_files = glob(os.path.join(input_folder, "*.csv"))

    try:
        os.mkdir(f"{output_folder}\\cleaned")
        print(f"Directory '{output_folder}\\cleaned' created successfully.")
    except FileExistsError:
        print(f"Directory '{output_folder}\\cleaned' already exists.")

    for file_path in sorted(csv_files):
        predicate = os.path.splitext(os.path.basename(file_path))[0]
        print(predicate)

        with open(file_path, newline='') as csvfile:
            reader = csv.reader(csvfile)

            writer = csv.writer(open(f"{output_folder}\\cleaned\\{predicate}_nemo.csv", 'w', newline=""))
            headers = next(reader)

            for row in reader:
                writer.writerow(row)


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Parse DatalogMTL CSV files.")
    parser.add_argument("--input", required=True, help="Path to the folder containing CSV files.")
    parser.add_argument("--output", default="C:\\Users\\Administrator\\OneDrive - UGent\\'22-'23\\Research\\Nemo\\nemo_v0.7.1_x86_64-pc-windows-msvc\\nemo_v0.7.1_x86_64-pc-windows-msvc\\output", help="Output directory name.")

    args = parser.parse_args()

    parse_datalog_csv_files(args.input, args.output)
    
    print(f"DatalogMTL facts written to directory {args.output}")

