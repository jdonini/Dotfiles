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
    BLUETOOTH_DEVICE_HCI_PATH,
    BRIGHTNESS_DIR,
    DEFAULT_FONT,
    GET_MICROPHONE_VOLUME_SHELL_CMD,
    GET_SPEAKERS_VOLUME_SHELL_CMD,
    ICONS_DIR,
    IS_MICROPHONE_MUTED_SHELL_CMD,
    KEYBOARD_DISPLAY,
    KEYBOARD_LAYOUTS,
    LOWER_SPEAKERS_VOLUME_SHELL_CMD,
    RAISE_SPEAKERS_VOLUME_SHELL_CMD,
    SET_BRIGHTNESS_SHELL_CMD,
    TOGGLE_MICROPHONE_MUTE_SHELL_CMD,
    TOGGLE_SPEAKERS_MUTE_SHELL_CMD,
    WALLPAPER_PATH,
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

window_name = widget.WindowName()

screens = [
    Screen(
        # wallpaper=WALLPAPER_PATH,
        # wallpaper_mode="fill",
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
                widget.CurrentLayout(padding=0),
                widget.Spacer(),
                widget.Clock(format="%d %b %I:%M %p"),
                widget.Spacer(),
                widgets.NetworkManager(
                    name="network_manager",
                    icons={
                        "802-3-ethernet": "???",
                        "802-11-wireless": "??? ",
                    },
                    format_string="{icon}",
                    no_connection_format_string="{icon} {network_name} "
                    "(no connection)",
                    update_interval=5,
                ),
                separator,
                widgets.Volume(
                    name="speakers_volume",
                    get_volume_shell_cmd=GET_SPEAKERS_VOLUME_SHELL_CMD,
                    raise_volume_shell_cmd=RAISE_SPEAKERS_VOLUME_SHELL_CMD,
                    lower_volume_shell_cmd=LOWER_SPEAKERS_VOLUME_SHELL_CMD,
                    get_muted_status_shell_cmd=ARE_SPEAKERS_MUTED_SHELL_CMD,
                    toggle_mute_shell_cmd=TOGGLE_SPEAKERS_MUTE_SHELL_CMD,
                    icons={"muted": "???", "low": "???", "medium": "???", "high": "???"},
                    update_interval=1,
                ),
                widgets.Volume(
                    name="microphone_volume",
                    get_volume_shell_cmd=GET_MICROPHONE_VOLUME_SHELL_CMD,
                    get_muted_status_shell_cmd=IS_MICROPHONE_MUTED_SHELL_CMD,
                    toggle_mute_shell_cmd=TOGGLE_MICROPHONE_MUTE_SHELL_CMD,
                    icons={"muted": "???", "low": "???", "medium": "???", "high": "???"},
                    update_interval=1,
                ),
                separator,
                # widgets.Battery(update_interval=60),
                # widget.Backlight(
                #     backlight_name=BRIGHTNESS_DIR,
                #     change_command=SET_BRIGHTNESS_SHELL_CMD,
                #     format="??? {percent:2.0%}",
                # ),
                widget.Systray(fontsize=12, scale=0.5),
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
                widget.CurrentLayout(padding=0),
                window_name,
                widget.Memory(measure_mem="G"),
                separator,
                widget.CryptoTicker(crypto="ETH", format="{crypto}:{amount:,.0f}"),
                widget.CryptoTicker(crypto="BTC", format="{crypto}:{amount:,.0f}"),
                separator,
                widget.KeyboardLayout(
                    configured_keyboards=KEYBOARD_LAYOUTS,
                    fmt="??? {}",
                    display=KEYBOARD_DISPLAY,
                ),
                widget.CheckUpdates(),
            ],
            30,
            margin=[5, 5, 0, 5],
        ),
    ),
]
