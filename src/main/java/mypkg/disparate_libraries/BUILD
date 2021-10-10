load("//:defs.bzl", "my_java_rule")

java_library(
    name = "helper8_real",
    srcs = ["Helper8.java"],
)
java_library(
    name = "helper11_real",
    srcs = ["Helper11.java"],
)

my_java_rule(
    name = "helper8",
    target_jdk = 8,
    deps = [":helper8_real"],
)

my_java_rule(
    name = "helper11",
    deps = [":helper11_real"],
)

java_binary(
    name = "app8",
    srcs = ["App8.java"],
    deps = [":helper8"],
    main_class = "mypkg.mypkg.disparate_libraries.App"
)

java_binary(
    name = "app11",
    srcs = ["App11.java"],
    deps = [":helper11"],
    main_class = "mypkg.mypkg.disparate_libraries.App"
)
