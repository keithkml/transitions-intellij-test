load("//:defs.bzl", "my_java_rule")

java_library(
    name = "helper",
    srcs = ["Helper.java"],
)

my_java_rule(
    name = "helper8",
    target_jdk = 8,
    deps = [":helper"],
)

my_java_rule(
    name = "helper11",
    deps = [":helper"],
)

java_binary(
    name = "app8",
    srcs = ["App.java"],
    deps = [":helper8"],
    main_class = "mypkg.build_library_for_both.App"
)

java_binary(
    name = "app11",
    srcs = ["App.java"],
    deps = [":helper11"],
    main_class = "mypkg.build_library_for_both.App"
)
