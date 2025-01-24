load(
    ":cc_toolchain_config.bzl",
    "cc_toolchain_config_clang20",
    "cc_toolchain_config_gcc13",
)

package(default_visibility = ["//visibility:public"])

cc_toolchain_config_clang20(name = "toolchain_config_clang20")

cc_toolchain_config_gcc13(name = "toolchain_config_gcc13")

filegroup(name = "empty")

cc_toolchain(
    name = "xc_cc_toolchain_clang20",
    all_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 0,
    toolchain_config = ":toolchain_config_clang20",
    toolchain_identifier = "linux_x86_64-toolchain",
)

toolchain(
    name = "xc_toolchain_clang20",
    exec_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:linux",
    ],
    target_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:linux",
    ],
    toolchain = ":xc_cc_toolchain_clang20",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)

cc_toolchain(
    name = "xc_cc_toolchain_gcc13",
    all_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 0,
    toolchain_config = ":toolchain_config_gcc13",
    toolchain_identifier = "linux_x86_64-toolchain",
)

toolchain(
    name = "xc_toolchain_gcc13",
    exec_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:linux",
    ],
    target_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:linux",
    ],
    toolchain = ":xc_cc_toolchain_gcc13",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)

# toolchain(
#     name = "xc_toolchain_default",
#     exec_compatible_with = [
#         "@platforms//cpu:x86_64",
#         "@platforms//os:linux",
#     ],
#     target_compatible_with = [
#         "@platforms//cpu:x86_64",
#         "@platforms//os:linux",
#     ],
#     toolchain = "@local_config_cc//:cc-compiler-k8",
#     toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
# )