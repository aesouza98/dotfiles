# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

# Qtile keybindings

from libqtile.config import Key, KeyChord
from libqtile.command import lazy


sup = "mod4"
alt = "mod1"

keys = [
    # ------------ Window Configs ------------

    # Switch between windows in current stack pane
    Key([sup], "j", lazy.layout.down()),
    Key([sup], "k", lazy.layout.up()),
    Key([sup], "h", lazy.layout.shrink()),
    Key([sup], "l", lazy.layout.grow()),

    # Change window sizes (MonadTall)
    Key([sup, "shift"], "l", lazy.layout.grow()),
    Key([sup, "shift"], "h", lazy.layout.shrink()),

    # Toggle floating
    Key([sup, "shift"], "f", lazy.window.toggle_floating()),

    # Toggle fullscreen
    Key([sup], "f", lazy.window.toggle_fullscreen()),

    # Flip Layout
    Key([sup, "control"], "f", lazy.layout.flip()),

    # Move windows up or down in current stack
    Key([sup, "shift"], "j", lazy.layout.shuffle_down()),
    Key([sup, "shift"], "k", lazy.layout.shuffle_up()),

    # Toggle between different layouts as defined below
    Key([sup], "Tab", lazy.next_layout()),
    Key([sup, "shift"], "Tab", lazy.prev_layout()),

    # Kill window
    Key([sup], "w", lazy.window.kill()),

    # Switch focus of monitors
    Key([sup], "period", lazy.next_screen()),
    Key([sup], "comma", lazy.prev_screen()),

    # Restart Qtile
    Key([sup, "shift"], "r", lazy.restart()),
    Key([sup, "control"], "q", lazy.shutdown()),
    Key([sup], "r", lazy.spawncmd()),

    # ------------ App Configs ------------

    # Menu
    Key([sup], "d", lazy.spawn("rofi -show drun")),

    # Window Nav
    Key([alt], "Tab", lazy.spawn("rofi -show")),

    # Settings
    Key([sup, "shift"], "c", lazy.spawn("configfiles")),

    # Power Menu
    Key([sup, "shift"], "p", lazy.spawn("rofi -show powermenu -modi powermenu:rofi-power-menu")),

    # Arch logout
    Key([sup], "x", lazy.spawn("archlinux-logout")),

    # Browser
    Key([sup], "q", lazy.spawn("firefox")),

    # Work Browser
    Key([sup, "shift"], "q", lazy.spawn("flatpak run com.google.Chrome")),

    # File Explorer
    Key([sup], "e", lazy.spawn("pcmanfm")),

    # Terminal
    Key([sup], "Return", lazy.spawn("alacritty")),

    # Redshift
    Key([sup], "r", lazy.spawn("redshift -P -O 4000")),
    Key([sup, "control"], "r", lazy.spawn("redshift -x")),

    # Screenshot
    Key([sup, "shift"], "s", lazy.spawn("flameshot gui")),

    # ------------ Hardware Configs ------------

    # Volume
    Key([], "XF86AudioLowerVolume", lazy.spawn("changevolume down")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("changevolume up")),
    Key([], "XF86AudioMute", lazy.spawn("changevolume mute")),

    # Mic Volume
    Key([sup], "XF86AudioLowerVolume", lazy.spawn("micvolume down")),
    Key([sup], "XF86AudioRaiseVolume", lazy.spawn("micvolume up")),
    Key([sup], "XF86AudioMute", lazy.spawn("micvolume mute")),
    Key([sup], "F1", lazy.spawn("micvolume mute")),

    # Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightness up")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightness down")),

    # -------------- KeyChords -----------------
    KeyChord([sup], "space", [
        Key([], "n", lazy.spawn("notion-app-enhanced")),
        Key([], "v", lazy.spawn("pritunl-client-electron")),
        Key([], "o", lazy.spawn("obsidian")),
        Key([], "b", lazy.spawn("bitwarden-desktop")),
        Key([], "w", lazy.spawn("nitrogen")),
        Key([], "m", lazy.spawn("flatpak run com.spotify.Client")),
        Key([], "e", lazy.spawn("easyeffects")),
        Key([], "f", lazy.spawn("firefox")),
    ]),
]
