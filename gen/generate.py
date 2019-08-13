import json
import os

with open(
    os.environ["HOME"] + "/.elm/0.19.0/package/danmarcab/material-icons/1.0.0/docs.json"
) as f:
    docs = json.load(f)

for mod in docs:
    name = mod["name"]
    category = name.split(".")[-1]
    with open("src/MaterialUI/Icons/%s.elm" % category, "w") as f:
        f.write("module MaterialUI.Icons.%s exposing\n" % category)
        f.write("    ( ")
        f.write("\n    , ".join(value["name"] for value in mod["values"]))
        f.write("\n    )\n\n")

        f.write("{-|")
        f.write(mod["comment"])
        f.write("-}\n\n")

        f.write("import Material.Icons.%s as %s\n" % (category, category))
        f.write("import MaterialUI.Icon exposing (Icon, makeIcon)\n\n\n")

        f.write(
            "\n\n".join(
                """{name} : Icon msg
{name} =
    makeIcon {category}.{name}
""".format(
                    name=value["name"], category=category
                )
                for value in mod["values"]
            )
        )
