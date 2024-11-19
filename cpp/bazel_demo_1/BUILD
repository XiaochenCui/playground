load("@rules_foreign_cc//foreign_cc:defs.bzl", "make")

make(
    name = "libexample",
    args = [
        "-j",
    ],
    lib_source = "@libexample//:all",
    out_lib_dir = "",  # Override the default lib directory "lib".
    out_static_libs = ["libexample.a"],
    targets = [""],  # Specify the targets since the default targets include "install".
    visibility = ["//visibility:public"],
)

config_setting(
    name = "debug",
    values = {"compilation_mode": "dbg"},
)
