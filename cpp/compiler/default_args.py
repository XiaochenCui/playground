#!/usr/bin/env python3
import xiaochen_py


def compare():
    gcc = "g++-13"
    clang = "clang++-20"

    gcc_output, _ = xiaochen_py.run_command(
        f"echo | {gcc} -xc++ -v -", raise_on_failure=False, stream_output=False
    )
    # print(gcc_output)

    lines = gcc_output.decode("utf-8").split("\n")
    arg_start = False
    arg_line = ""
    for i, line in enumerate(lines):
        print(f"{i}: {line}")
        if line.startswith("COLLECT_GCC_OPTIONS"):
            arg_start = True
            arg_line = line
            continue
        if arg_start:
            if line.startswith(" "):
                arg_line += line
            else:
                arg_start = False
                break
    print(f"GCC: {arg_line}")


if __name__ == "__main__":
    compare()
