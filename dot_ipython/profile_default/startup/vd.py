# location ~/.ipython/profile_default/startup
from IPython.core.magic import register_line_magic
import visidata


@register_line_magic
def vd(line):
    exec(f"visidata.vd.view_pandas({line})")
