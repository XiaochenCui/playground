#!/usr/bin/env python3
import difflib
from typing import List
import xiaochen_py


def compare():
    gcc = "g++-13"
    args_c = get_args(gcc, "c")
    args_cpp = get_args(gcc, "c++")

    diff = difflib.unified_diff(args_c, args_cpp, lineterm="")
    for line in diff:
        print(line)

    clang = "clang++-20"


def get_args(compiler: str, lang: str) -> List[str]:
    gcc_output, _ = xiaochen_py.run_command(
        f"echo | {compiler} -x{lang} -v -",
        capture_tty=True,
        raise_on_failure=False,
        stream_output=False,
    )
    lines = gcc_output.decode("utf-8").split("\n")

    arg_line = None
    for i, line in enumerate(lines):
        if line.startswith(" /usr/libexec/gcc/x86_64-linux-gnu/13/collect2"):
            arg_line = line
            break
    print(f">>> default args: {arg_line}")

    args = arg_line.split(" ")
    # for i, arg in enumerate(args):
    #     print(f"{i}: {arg}")
    # args = line.split(" ")
    return args[2:]


if __name__ == "__main__":
    compare()
