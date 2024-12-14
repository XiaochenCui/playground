#!/usr/bin/env python3

# run with:
# ./print.py 1>stdout.log 2>stderr.log

import os
import sys

print(f"this goes to stdout", file=os.sys.stdout, flush=True)
print(f"this goes to stderr", file=sys.stderr, flush=True)
# Open the console device (typically /dev/tty on Unix-like systems)
with open("/dev/tty", "w") as console:
    console.write("This goes directly to the console!\n")
