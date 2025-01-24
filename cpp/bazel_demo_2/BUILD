# ====================================================================================== #
# external dependencies
# ====================================================================================== #
load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

cmake(
    name = "spdlog",
    build_args = ["-j"],
    lib_source = "@spdlog//:all",
    out_static_libs = select({
        "//conditions:default": ["libspdlog.a"],

        # spdlog produces a library with "d" postfix when building in debug mode.
        #
        # The ideal approach is to use CMAKE_DEBUG_POSTFIX so the library name is consistent with the default one, but spdlog doesn't support this option. So we have to adapt to it.
        ":debug": ["libspdlogd.a"],
    }),
    visibility = ["//visibility:public"],
)

config_setting(
    name = "debug",
    values = {"compilation_mode": "dbg"},
)

# ====================================================================================== #
# custom toolchains
# ====================================================================================== #
bazel_dep(
    name = "platforms",
    version = "0.0.10",
)

register_toolchains(
    "//toolchain:xc_toolchain_clang20",
)

cc_binary(
    name = "log",
    srcs = ["log.cc"],
    deps = [
        "//:spdlog",
    ],
)
