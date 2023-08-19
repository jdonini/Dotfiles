"""
Top bar configuration lives here
"""
import os

from libqtile import bar, widget
from libqtile.config import Screen

import widgets
from colors import color_schema
from utils import (
    ARE_SPEAKERS_MUTED_SHELL_CMD,
    DEFAULT_FONT,
    GET_MICROPHONE_VOLUME_SHELL_CMD,
    GET_SPEAKERS_VOLUME_SHELL_CMD,
    ICONS_DIR,
    IS_MICROPHONE_MUTED_SHELL_CMD,
    KEYBOARD_DISPLAY,
    KEYBOARD_LAYOUTS,
    LOWER_SPEAKERS_VOLUME_SHELL_CMD,
    RAISE_SPEAKERS_VOLUME_SHELL_CMD,
    TOGGLE_MICROPHONE_MUTE_SHELL_CMD,
    TOGGLE_SPEAKERS_MUTE_SHELL_CMD,
)


widget_defaults = dict(
    font=DEFAULT_FONT,
    background=color_schema["bg"],
    foreground=color_schema["fg"],
    fontsize=14,
    padding=3,
)
extension_defaults = widget_defaults.copy()
separator = widget.Sep(size_percent=50, foreground=color_schema["fg3"])

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    disable_drag=True,
                    use_mouse_wheel=False,
                    active=color_schema["fg"],
                    inactive=color_schema["dark-gray"],
                    highlight_method="text",
                    this_current_screen_border=color_schema["dark-yellow"],
                    urgent_alert_method="text",
                    urgent_text=color_schema["dark-red"],
                    fontsize=16,
                ),
                separator,
                widget.CurrentLayoutIcon(
                    custom_icon_paths=[os.path.join(ICONS_DIR, "layouts")],
                    scale=0.5,
                    padding=0,
                ),
                widget.Spacer(),
                widget.Clock(format="%d %b %I:%M %p"),
                widget.Spacer(),
                widgets.NetworkManager(
                    name="network_manager",
                    icons={
                        "802-3-ethernet": "",
                        "802-11-wireless": " ",
                    },
                    format_string="{icon}",
                    no_connection_format_string="{icon} {network_name} "
                    "(no connection)",
                    update_interval=5,
                ),
                widget.Net(
                    interface="wlan0",
                    format="{down} ↓↑ {up}",
                    update_interval=2,
                ),
                separator,
                widgets.Volume(
                    name="speakers_volume",
                    get_volume_shell_cmd=GET_SPEAKERS_VOLUME_SHELL_CMD,
                    raise_volume_shell_cmd=RAISE_SPEAKERS_VOLUME_SHELL_CMD,
                    lower_volume_shell_cmd=LOWER_SPEAKERS_VOLUME_SHELL_CMD,
                    get_muted_status_shell_cmd=ARE_SPEAKERS_MUTED_SHELL_CMD,
                    toggle_mute_shell_cmd=TOGGLE_SPEAKERS_MUTE_SHELL_CMD,
                    icons={"muted": "婢", "low": "奄", "medium": "奔", "high": "墳"},
                    update_interval=1,
                ),
                widgets.Volume(
                    name="microphone_volume",
                    get_volume_shell_cmd=GET_MICROPHONE_VOLUME_SHELL_CMD,
                    get_muted_status_shell_cmd=IS_MICROPHONE_MUTED_SHELL_CMD,
                    toggle_mute_shell_cmd=TOGGLE_MICROPHONE_MUTE_SHELL_CMD,
                    icons={"muted": "", "low": "", "medium": "", "high": ""},
                    update_interval=1,
                ),
                separator,
                widget.Systray(fontsize=12, scale=0.5),
            ],
            30,
            margin=[5, 5, 0, 5],
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(),
                widget.Memory(
                    format=": {MemUsed:.2f}/{MemTotal:.2f}{mm}",
                    update_interval=1.0,
                    measure_mem="G",
                ),
                separator,
                widget.DF(
                    partition="/home",
                    visible_on_warn=False,
                    format=" {uf}{m}|{r:.0f}%",
                    measure="G",
                    warn_color=color_schema["red"],
                    warn_space=40,
                ),
                separator,
                widget.CPU(format="󰘷 {freq_current}GHz {load_percent}%"),
                widget.ThermalSensor(
                    tag_sensor="Tctl",
                    format="{temp:.0f}{unit}",
                    update_interval=2,
                    threshold=70,
                    foreground=color_schema["fg"],
                ),
                separator,
                widget.NvidiaSensors(
                    format=" {temp}°C",
                    update_interval=2,
                    threshold=85,
                    foreground_alert=color_schema["red"],
                    foreground=color_schema["fg"],
                ),
                separator,
                widget.Mpris2(
                    name="spotify",
                    paused_text=" : {track}",
                    stop_text="  ",
                    display_metadata=["xesam:title", "xesam:artist"],
                    objname="org.mpris.MediaPlayer2.spotify",
                    scroll_interval=0.3,
                ),
                widget.CheckUpdates(
                    colour_have_updates=color_schema["dark-cyan"],
                    no_update_string="",
                    display_format="{updates}",
                    update_interval=600,
                    custom_command="checkupdates",
                    fmt="   {}",
                ),
            ],
            30,
            margin=[5, 5, 0, 5],
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    disable_drag=True,
                    use_mouse_wheel=False,
                    active=color_schema["fg"],
                    inactive=color_schema["dark-gray"],
                    highlight_method="text",
                    this_current_screen_border=color_schema["dark-yellow"],
                    urgent_alert_method="text",
                    urgent_text=color_schema["dark-red"],
                    fontsize=16,
                ),
                separator,
                widget.CurrentLayoutIcon(
                    custom_icon_paths=[os.path.join(ICONS_DIR, "layouts")],
                    scale=0.5,
                    padding=0,
                ),
                widget.Spacer(),
                widget.CryptoTicker(crypto="ETH", format="{crypto}:{amount:,.0f}"),
                widget.CryptoTicker(crypto="BTC", format="{crypto}:{amount:,.0f}"),
                separator,
                widget.KeyboardLayout(
                    configured_keyboards=KEYBOARD_LAYOUTS,
                    fmt=" {}",
                    display=KEYBOARD_DISPLAY,
                ),
            ],
            30,
            margin=[5, 5, 0, 5],
        ),
    ),
]
