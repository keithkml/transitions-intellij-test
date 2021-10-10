def _my_java_incoming_transition_impl(settings, attr):
    orig = settings["//command_line_option:javacopt"]
    if attr.target_jdk:
        print("Building %s for JDK %d" % (attr.name, attr.target_jdk))
        return {
            "//command_line_option:javacopt": orig + ["--release=%d" % attr.target_jdk],
        }
    print("Building %s for default JDK" % attr.name)
    return {
        "//command_line_option:javacopt": orig,
    }

my_java_incoming_transition = transition(
    implementation = _my_java_incoming_transition_impl,
    inputs = ["//command_line_option:javacopt"],
    outputs = ["//command_line_option:javacopt"],
)

def _my_java_rule_impl(ctx):
    return [java_common.merge([dep[JavaInfo] for dep in ctx.attr.deps if JavaInfo in dep])]

my_java_rule = rule(
    attrs = {
        "target_jdk": attr.int(values = (8, 11)),
        "deps": attr.label_list(),
        "_allowlist_function_transition": attr.label(
            default = "@bazel_tools//tools/allowlists/function_transition_allowlist",
        ),
    },
    implementation = _my_java_rule_impl,
    cfg = my_java_incoming_transition,
)
