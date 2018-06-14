from pathlib import Path
import argparse


def parse():
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--dir')
    return parser.parse_args()


def main():
    args = parse()
    P = Path(__file__).resolve().parent
    for d in P.iterdir():
        if d.name == args.dir:
            target = d
    for nii in target.glob('**/*.nii'):
        print(nii)


if __name__ == '__main__':
    main()
