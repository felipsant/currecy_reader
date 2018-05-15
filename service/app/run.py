from app.app import run
from argparse import ArgumentParser 
parser = ArgumentParser()
parser.add_argument("c", nargs='?', help="Import Currency")
parser.add_argument("h", nargs='?', help="Import Currency 7 Last Days")
parser.add_argument("k", nargs='?', help="Import Currency 180 Last Days")
args = parser.parse_args()
run(args.c)