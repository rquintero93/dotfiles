# location ~/.ipython/profile_default/startup
import visidata
from IPython.core.magic import register_line_magic


@register_line_magic
def vd(line):
    visidata.vd.options.quitguard = True
    visidata.vd.options.disp_sidebar = False
    visidata.vd.options.save_filetype = "csv"
    visidata.vd.options.color_active_status = "yellow"
    visidata.vd.options.color_bottom_hdr = "underline blue"
    visidata.vd.options.color_default = "blue"
    visidata.vd.options.color_sidebar = "blue"
    visidata.vd.options.color_sidebar_title = "green"
    visidata.vd.options.color_cmdpalette = "blue"
    visidata.vd.options.color_warning = "red"
    visidata.vd.options.color_key_col = "green"
    visidata.vd.options.color_menu_active = "black"
    visidata.vd.options.color_working = "green"
    visidata.vd.options.color_longname_guide = "black"
    visidata.vd.options.color_longname_status = "black"
    visidata.vd.options.color_keystrokes = "bold black"
    visidata.vd.options.color_selected_row = "red"
    visidata.vd.options.color_note_type = "red"
    visidata.vd.options.color_column_sep = "blue"
    visidata.vd.options.color_menu = "blue"
    visidata.vd.options.color_menu_help = "blue"
    exec(f"visidata.vd.view_pandas({line})")
