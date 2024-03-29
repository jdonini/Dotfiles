"""
Various environment specific constants and functions used across the whole
Qtile configuration
"""
from pathlib import Path

MOD_KEY = "mod4"
TERMINAL = "kitty"
DEFAULT_FONT = "Hack Nerd Font"

AUTOSTART_APPS = [
    # run arandr
    "killall -qw xrandr; xrandr --output HDMI-0 --mode 1920x1080 --pos 3000x0 --rotate right --output DP-1 --primary --mode 1920x1080 --pos 1080x0 --rotate normal --output DP-3 --mode 1920x1080 --pos 0x0 --rotate left &",
    # set auto-repeat delay and rate
    "xset r rate 300 25",
    # trigger session lock after 5 minutes of inactivity,
    # turn display off 2 minutes later
    "xset s 30000; xss-lock -- ~/.local/bin/lock-screen &",
    # run window compositor (restart if running already)
    "killall -qw picom; picom -b",
    # run notification daemon
    "killall -qw dunst; dunst &",
    # run bluetooth daemon
    "killall -qw blueman-applet; blueman-applet &",
    # run flameshot
    "flameshot &",
    # run deluge
    "deluge-gtk &",
    # run Franz
    "franz &",
    # nitrogen
    "nitrogen --restore &",
    # enpass
    "enpass &",
    # insync
    "insync start &",
    # Power Manager
    "xfce4-power-manager &",
]
"""
Shell commands which will be started each time Qtile starts in the order that
they are defined here
"""

RUN_APP_LAUNCHER_SHELL_CMD = "rofi -show drun"

BRIGHTNESS_DIR = "amdgpu_bl0"
"""
Directory name in /sys/class/backlight which provides
backlight control interface
"""

SET_BRIGHTNESS_SHELL_CMD = "brightnessctl set {}%"

"""
Shell command template to set screen brightness
"""

ICONS_DIR = str(Path.home() / ".config" / "qtile" / "icons")
WALLPAPER_PATH = str(Path.home() / ".config" / "qtile" / "wallpapers" / "spaceman.jpg")

TAKE_SCREENSHOT_SHELL_CMD = """
    maim -o -s \
        | tee $(xdg-user-dir PICTURES)/screenshot_$(date +%F_%H.%M.%S).png \
        | xclip -selection clipboard -t image/png
"""
"""
Shell command to take a screenshot, save it to images directory and copy
it to the clipboard
"""

LOCK_X_SESSION_SHELL_CMD = "loginctl lock-session"
"""
Shell command to lock X session
"""

KEYBOARD_DISPLAY = {"us intl": "us intl"}
KEYBOARD_LAYOUTS = list(KEYBOARD_DISPLAY.keys())

"""
List of keyboard layouts which should be available in system
"""

GET_SPEAKERS_VOLUME_SHELL_CMD = """
    pactl get-sink-volume @DEFAULT_SINK@ \
    | grep -i Volume \
    | awk '{print $5}' \
    | sed 's/%//'
"""
RAISE_SPEAKERS_VOLUME_SHELL_CMD = """
    pactl set-sink-mute @DEFAULT_SINK@ 0 && \
    pactl set-sink-volume @DEFAULT_SINK@ +5%
"""
LOWER_SPEAKERS_VOLUME_SHELL_CMD = "pactl set-sink-volume @DEFAULT_SINK@ -5%"
ARE_SPEAKERS_MUTED_SHELL_CMD = """
    pactl get-sink-mute @DEFAULT_SINK@ \
        | grep -q 'no' \
        && echo 0 \
        || echo 1
"""
TOGGLE_SPEAKERS_MUTE_SHELL_CMD = "pactl set-sink-mute @DEFAULT_SINK@ toggle"

GET_MICROPHONE_VOLUME_SHELL_CMD = """
    pactl get-source-volume @DEFAULT_SOURCE@ \
    | grep -i Volume \
    | awk '{print $5}' \
    | sed 's/%//'
"""
IS_MICROPHONE_MUTED_SHELL_CMD = """
    pactl get-source-mute @DEFAULT_SOURCE@ \
        | grep -q 'no' \
        && echo 0 \
        || echo 1
"""
TOGGLE_MICROPHONE_MUTE_SHELL_CMD = """
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
"""

BLUETOOTH_DEVICE_HCI_PATH = "/dev_88_C9_E8_70_7E_5A"
