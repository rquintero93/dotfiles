# location ~/.ipython/profile_default/startup
from IPython.core.magic import register_line_magic


@register_line_magic
def vd(line):
    vd.options.color_default = "blue"

    exec(f"visidata.vd.view_pandas({line})")
