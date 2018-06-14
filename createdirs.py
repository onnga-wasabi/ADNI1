from pathlib import Path
import os
import argparse
import pandas as pd

DST_DIR = os.environ.get('FREESURFER_DST')


def parse():
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--dir')
    return parser.parse_args()


def main():
    args = parse()
    P = Path(__file__).resolve().parent / args.dir
    for csv in P.glob('*.csv'):
        df = pd.read_csv(csv.resolve())
    for label, subject in zip(df['Group'], df['Subject']):
        target = Path(DST_DIR) / label / subject
        if not target.exists():
            target.mkdir()


if __name__ == '__main__':
    main()
