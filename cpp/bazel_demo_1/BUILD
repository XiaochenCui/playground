load("@rules_foreign_cc//foreign_cc:defs.bzl", "make")

make(
    name = "libexample",
    args = [
        "-j",
    ],
    # targets = [""],  # Specify the targets since the default targets include "install".
    env = {
        "DESTDIR": "build",
        "prefix": "",
    },
    # postfix_script = "set -x\npwd\nls\nexit 88\n",
    # postfix_script = "set -x\npwd\n",
    # install_prefix = ".",
    lib_source = "@libexample//:all",
    out_lib_dir = "./build/lib/",  # Override the default lib directory "lib".
    out_static_libs = ["libexample.a"],
    visibility = ["//visibility:public"],
)
