"""
TODO: add module docstring
"""

load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")

load(
    "@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "feature",
    "flag_group",
    "flag_set",
    "tool_path",
)

all_compile_actions = [
    ACTION_NAMES.c_compile,
    ACTION_NAMES.cpp_compile,
]

all_link_actions = [
    # needed by "spdlog"
    ACTION_NAMES.cpp_link_executable,
    # ACTION_NAMES.cpp_link_dynamic_library,
    # ACTION_NAMES.cpp_link_nodeps_dynamic_library,
]


def impl_clang20(ctx):
    tool_paths = [
        tool_path(
            name="gcc",
            # path="/usr/lib/llvm-20/bin/clang++",
            path="/usr/lib/llvm-20/bin/clang",
        ),
        tool_path(
            name="ld",
            path="/usr/lib/llvm-20/bin/ld.lld",
        ),
        tool_path(
            name="ar",
            path="/usr/lib/llvm-20/bin/llvm-ar",
        ),
        tool_path(
            name="cpp",
            path="/bin/false",
        ),
        tool_path(
            name="gcov",
            path="/bin/false",
        ),
        tool_path(
            name="nm",
            path="/bin/false",
        ),
        tool_path(
            name="objdump",
            path="/bin/false",
        ),
        tool_path(
            name="strip",
            path="/bin/false",
        ),
    ]

    features = [
        feature(
            name="xc_flags",
            enabled=True,
            flag_sets=[
                flag_set(
                    actions=all_compile_actions,
                    flag_groups=(
                        [
                            flag_group(
                                flags=[
                                    "-Wno-c23-extensions",
                                ]
                            ),
                        ]
                    ),
                ),
                flag_set(
                    actions=all_link_actions,
                    flag_groups=(
                        [
                            flag_group(
                                flags=[
                                    # needed when ((c++ stdlib api is used) AND (compiler is clang))
                                    "-lstdc++",
                                    # needed when (compiler is clang)
                                    # most libraries require the "math" library
                                    "-lm",
                                ],
                            ),
                        ]
                    ),
                ),
            ],
        ),
    ]

    return cc_common.create_cc_toolchain_config_info(
        ctx=ctx,
        features=features,
        cxx_builtin_include_directories=[
            "/usr/lib/llvm-20/lib/clang/20/include",
            "/usr/include",
            # directory which contains embedded files
            # note that we must use absolute path here since clang embeds the file using absolute path
            "/home/xiaochen/code/small-db-v2/src/query",
        ],
        toolchain_identifier="k8-toolchain",
        host_system_name="local",
        target_system_name="local",
        target_cpu="k8",
        target_libc="unknown",
        compiler="clang",
        abi_version="unknown",
        abi_libc_version="unknown",
        tool_paths=tool_paths,
    )


cc_toolchain_config_clang20 = rule(
    implementation=impl_clang20,
    attrs={},
    provides=[CcToolchainConfigInfo],
)


def impl_gcc13(ctx):
    tool_paths = [
        tool_path(
            name="gcc",
            # path="/usr/bin/g++-13",
            path="/usr/bin/gcc-13",
        ),
        tool_path(
            name="ld",
            path="/usr/bin/ld",
        ),
        tool_path(
            name="ar",
            path="/usr/bin/ar",
        ),
        tool_path(
            name="cpp",
            path="/bin/false",
        ),
        tool_path(
            name="gcov",
            path="/bin/false",
        ),
        tool_path(
            name="nm",
            path="/bin/false",
        ),
        tool_path(
            name="objdump",
            path="/bin/false",
        ),
        tool_path(
            name="strip",
            path="/bin/false",
        ),
    ]

    features = [
        feature(
            name="default_compile_flags",
            enabled=True,
            flag_sets=[
                flag_set(
                    actions=all_link_actions,
                    flag_groups=(
                        [
                            flag_group(
                                flags=[
                                    # needed when ((c++ stdlib api is used) AND (compiler is gcc))
                                    "-lstdc++",
                                    # needed when ((c++ math api is used) AND (compiler is gcc))
                                    # most libraries require the "math" library
                                    "-lm",
                                ],
                            ),
                        ]
                    ),
                ),
            ],
        ),
    ]

    return cc_common.create_cc_toolchain_config_info(
        ctx=ctx,
        features=features,
        cxx_builtin_include_directories=[
            "/usr/lib/gcc/x86_64-linux-gnu/13/include",
            "/usr/include",
        ],
        toolchain_identifier="k8-toolchain",
        host_system_name="local",
        target_system_name="local",
        target_cpu="k8",
        target_libc="unknown",
        compiler="gcc",
        abi_version="unknown",
        abi_libc_version="unknown",
        tool_paths=tool_paths,
    )


cc_toolchain_config_gcc13 = rule(
    implementation=impl_gcc13,
    attrs={},
    provides=[CcToolchainConfigInfo],
)
