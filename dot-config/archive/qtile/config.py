#   ___ _____ ___ _     _____    ____             __ _       
#  / _ \_   _|_ _| |   | ____|  / ___|___  _ __  / _(_) __ _ 
# | | | || |  | || |   |  _|   | |   / _ \| '_ \| |_| |/ _` |
# | |_| || |  | || |___| |___  | |__| (_) | | | |  _| | (_| |
#  \__\_\|_| |___|_____|_____|  \____\___/|_| |_|_| |_|\__, |
#                                                      |___/ 

# Icons: https://fontawesome.com/search?o=r&m=free

import os
import re
import socket
import subprocess
import psutil
import json
from libqtile import hook
from libqtile import qtile
from typing import List  
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown, KeyChord
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.widget import Spacer, Backlight
from libqtile.widget.image import Image
from libqtile.dgroups import simple_key_binder
from pathlib import Path
from settings.spotify import Spotify

# Get home path
home = str(Path.home())

# --------------------------------------------------------
# Define Status Bar
# --------------------------------------------------------
# wm_bar = "polybar"
wm_bar = "qtile"

# --------------------------------------------------------
# Check for Desktop/Laptop
# --------------------------------------------------------
# 3 = Desktop
platform = int(os.popen("cat /sys/class/dmi/id/chassis_type").read())

# --------------------------------------------------------
# Set default apps
# --------------------------------------------------------
terminal = "alacritty"        
browser = "thorium-browser"
browser2 = "flatpak run com.google.Chrome"
file_manager = "thunar"

# --------------------------------------------------------
# Keybindings
# --------------------------------------------------------
mod = "mod4" # SUPER KEY

keys = [

    # Focus
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window around"),
    
    # Move
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),

    # Swap
    Key([mod, "shift"], "h", lazy.layout.swap_left()),
    Key([mod, "shift"], "l", lazy.layout.swap_right()),

    # Media and Screenshot
    Key([mod], "Print", lazy.spawn(home + "/dotfiles/scripts/scrot.sh")),
    Key([mod, "shift"], "s", lazy.spawn("flameshot gui")),

    # Volume
    Key([], "XF86AudioLowerVolume", lazy.spawn("soundvolume down")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("soundvolume up")),
    Key([], "XF86AudioMute", lazy.spawn("soundvolume mute")),

    # Mic Volume
    Key([mod], "XF86AudioLowerVolume", lazy.spawn("micvolume down")),
    Key([mod], "XF86AudioRaiseVolume", lazy.spawn("micvolume up")),
    Key([mod], "XF86AudioMute", lazy.spawn("micvolume mute")),
    Key([mod], "F1", lazy.spawn("micvolume mute")),

    # Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightness up")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightness down")),

    # Size
    # Key([mod], "h", lazy.layout.shrink(), lazy.layout.decrease_nmaster(), desc='Shrink window (MonadTall)'),
    # Key([mod], "l", lazy.layout.grow(), lazy.layout.increase_nmaster(), desc='Expand window (MonadTall)'),
    Key([mod, "control"], "Down", lazy.layout.shrink(), desc="Grow window to the left"),
    Key([mod, "control"], "Up", lazy.layout.grow(), desc="Grow window to the right"),
    # Key([mod, "control"], "Down", lazy.layout.grow_down(), desc="Grow window down"),
    # Key([mod, "control"], "Up", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Floating
    Key([mod], "t", lazy.window.toggle_floating(), desc='Toggle floating'),
    
    # Split
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),

    # Toggle Layouts
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),

    # Fullscreen
    Key([mod], "f", lazy.window.toggle_fullscreen()),

    #System
    Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod], "p", lazy.spawn("powermenu"), desc="Open Powermenu"),
    
    # Apps
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "e", lazy.spawn(file_manager), desc="Launch Rofi"),
    Key([mod], "d", lazy.spawn("rofi -show drun"), desc="Launch Rofi"),
    Key([mod], "r", lazy.spawn("rofi -show drun"), desc="Launch Rofi"),
    Key([mod], "b", lazy.spawn(browser), desc="Launch Browser"),
    Key([mod, "shift"], "b", lazy.spawn(browser2), desc="Launch Browser"),
    Key([mod, "control"], "b", lazy.spawn("bookmarks"), desc="Rofi Brave Bookmarks"),
    #Key([mod], "v", lazy.spawn(home + "/dotfiles/scripts/looking-glass.sh"), desc="Start Looking Glass Client"),
    Key([mod], "v", lazy.spawn("vpn_connect"), desc="Start Looking Glass Client"),
    Key([mod, "shift"], "w", lazy.spawn("updatewal.sh"), desc="Update Theme and Wallpaper"),
    Key([mod, "control"], "w", lazy.spawn("wallpaper.sh"), desc="Select Theme and Wallpaper"),
#    Key([], 'F10', lazy.spawn("brave --app=https://chat.openai.com"), desc="Open ChatGPT")
]

# --------------------------------------------------------
# Groups
# --------------------------------------------------------

#groups = [
#    Group("1", layout='monadtall'),
#    Group("2", layout='monadtall'),
#    Group("3", layout='monadtall'),
#    Group("4", layout='monadtall'),
#    Group("5", layout='monadtall'),
#]

groups = [Group(i) for i in [
    "1", "2", "3", "4", "5", "6", "7", "8", "9",
]]

dgroups_key_binder = simple_key_binder(mod)

# --------------------------------------------------------
# Scratchpads
# --------------------------------------------------------

groups.append(ScratchPad("6", [
    DropDown("chatgpt", "thorium-browser --app=https://chat.openai.com", x=0.3, y=0.1, width=0.40, height=0.4, on_focus_lost_hide=False ),
    DropDown("mousepad", "mousepad", x=0.3, y=0.1, width=0.40, height=0.4, on_focus_lost_hide=False ),
    DropDown("terminal", "alacritty", x=0.3, y=0.1, width=0.40, height=0.4, on_focus_lost_hide=False ),
    DropDown("scrcpy", "scrcpy -d", x=0.8, y=0.05, width=0.15, height=0.6, on_focus_lost_hide=False )
]))

keys.extend([
    Key([mod], 'F10', lazy.group["6"].dropdown_toggle("chatgpt")),
    Key([mod], 'F11', lazy.group["6"].dropdown_toggle("mousepad")),
    Key([mod], 'F12', lazy.group["6"].dropdown_toggle("terminal")),
    Key([mod], 'F9', lazy.group["6"].dropdown_toggle("scrcpy"))
])

# --------------------------------------------------------
# Pywal Colors
# --------------------------------------------------------

colors = os.path.expanduser('~/.config/qtile/current.json')
colordict = json.load(open(colors))
ColorZ=(colordict['colors']['color0'])
ColorA=(colordict['colors']['color1'])
ColorB=(colordict['colors']['color2'])
ColorC=(colordict['colors']['color3'])
ColorD=(colordict['colors']['color4'])
ColorE=(colordict['colors']['color5'])
ColorF=(colordict['colors']['color6'])
ColorG=(colordict['colors']['color7'])
ColorH=(colordict['colors']['color8'])
ColorI=(colordict['colors']['color9'])
ColorJ=(colordict['colors']['color10'])
ColorK=(colordict['colors']['color11'])
ColorL=(colordict['colors']['color12'])
ColorM=(colordict['colors']['color13'])
ColorN=(colordict['colors']['color14'])
ColorO=(colordict['colors']['color15'])

ColorBG=(colordict['special']['background'])
ColorFG=(colordict['special']['foreground'])

ColorActive=(colordict['special']['active']) 
ColorInactive=(colordict['special']['inactive']) 
ColorUrgent=(colordict['special']['urgent']) 
ColorFocus =(colordict['special']['focus']) 

# --------------------------------------------------------
# Setup Layout Theme
# --------------------------------------------------------

layout_theme = { 
    "border_width": 2,
    "margin": 5,
    "border_focus": ColorFocus,
    "border_normal": ColorBG,
    "single_border_width": 3
}

# --------------------------------------------------------
# Layouts
# --------------------------------------------------------

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(),
    layout.MonadWide(**layout_theme),
]

# --------------------------------------------------------
# Setup Widget Defaults
# --------------------------------------------------------

widget_defaults = dict(
    #font="Fira Sans SemiBold",
    font="JetBrainsMono NerdFont",
    fontsize=14,
    padding=1,
    background=ColorBG,
    foreground=ColorFG,
)
extension_defaults = widget_defaults.copy()

# --------------------------------------------------------
# Widgets
# --------------------------------------------------------

def separator():
    return widget.Sep(linewidth=0, padding=5)

def separator2():
    return widget.Sep(linewidth=0, padding=20)

def separator3():
    return widget.TextBox(
        fmt='|',
        padding=7,
        foreground=ColorInactive,
        fontsize=10
    )

def spacer():
    return widget.Spacer(),

def icon(fontsize=16, text="?"):
    return widget.TextBox(
        fontsize=fontsize,
        text=text,
        padding=3
    )

def workspaces(): 
    return [
        widget.GroupBox(
            #font='JetBrainsMonoNL Nerd Font',
            fontsize=12,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            rounded=False,
            invert_mouse_wheel=False,
            highlight_method='line',
            urgent_alert_method='block',
            disable_drag=True,
            active=ColorFG,
            inactive=ColorInactive,
            urgent_border=ColorUrgent,

            highlight_color=ColorBG,
            this_screen_border=ColorFocus,
            this_current_screen_border=ColorFG,
            other_current_screen_border=ColorInactive,
            other_screen_border=ColorInactive,
        ),
       # separator(),
       # widget.WindowName(**base(fg='focus'), fontsize=14, padding=5, maxchars=200),
       # separator(),
    ]

# def volume():
#     return [
#         separator2(),
#         widget.PulseVolume(
#             fmt=' {}',
#             limit_max_volume=True,
#             update_interval=0,
#         ),
#     ]

def volume():
    return [
        widget.Volume(
            check_mute_command='pamixer --get-mute',
            check_mute_string='true',
            emoji_list=['󰸈 ','󰕿 ',' ',' '],
            emoji='true',
            get_volume_command='pamixer --get-volume-human',
            update_interval=0.2,
            volume_app='pamixer',
            mute_command='soundvolume mute',
            volume_down_command='soundvolume down',
            volume_up_command='soundvolume up',
        ),
        widget.Volume(
            check_mute_command='pamixer --get-mute',
            check_mute_string='true',
            get_volume_command='pamixer --get-volume-human',
            update_interval=0.2,
            volume_app='pamixer',
            mute_command='soundvolume mute',
            volume_down_command='soundvolume down',
            volume_up_command='soundvolume up',
        ),
    ]

def mic():
    return [
        widget.GenPollText(
            func = lambda: subprocess.check_output("micstatus").decode("utf-8"),
            mouse_callbacks = {
                'Button1': lambda: qtile.cmd_spawn("micvolume mute"),
                'Button3': lambda: qtile.cmd_spawn("pavucontrol"), 
            },
            update_interval=0.2,
        ),
    ]

def battery():
    return[
        widget.Battery(
            format='{char} {percent:2.0%}',
            charge_char='',
            discharge_char=' ',
            empty_char='',
        ),
    ]

def wlan():
    return[
        widget.Wlan(
            format='{essid}',
            fmt='  {}',
            disconnected_message='disconnected',
        ),
    ]

def spotify():
    return[
        Spotify(
            format='{icon} {artist} - {track}',
        ),
    ]

def updates():
    return[
        widget.CheckUpdates(
            colour_have_updates=ColorUrgent,
            colour_no_updates=ColorFG,
            fmt=' {}',
            no_update_string='0',
            display_format='{updates}',
            update_interval=1800,
            custom_command='checkupdates',
        ),
    ]

def calendar():
    return[
        icon(text=''),
        separator(),
        widget.Clock(format='%d/%m/%Y', foreground=ColorFG),
        separator3(),
        icon(text=''),
        separator(),
        widget.Clock(format='%H:%M'),
    ]

primary_widgets = [
    widget.CurrentLayoutIcon(scale=0.65),
    *workspaces(),
    separator3(),
    *spotify(),
    *spacer(),
    *calendar(),
    *spacer(),
    *updates(),
    separator3(),
    *mic(),
    separator3(),
    *volume(),
    separator(),
    widget.Systray(padding=5),
]

secondary_widgets = [
    widget.CurrentLayoutIcon(scale=0.65),
    *workspaces(),
    *spotify(),
    *spacer(),
    widget.Clock(format='%d/%m/%Y > %H:%M'),
    *spacer(),
    *wlan(),
    *battery(),
    *mic(),
    *volume(),
    #widget.CurrentLayout(**base(fg='color1'), padding=5),
]

# if (platform == 3):
    # del primary_widgets[12:14]
    # del primary_widgets[16]
    # del secondary_widgets[9]

# --------------------------------------------------------
# Screens
# --------------------------------------------------------

if (wm_bar == "polybar"):
    screens = [Screen(top=bar.Gap(size=28))]
else:
    screens = [
        Screen(
            top=bar.Bar(
    		primary_widgets,
                24,
                opacity=0.8,
                border_width=[0, 0, 0, 0],
                margin=[0,0,0,0]
            ),
        ),
    ]

# --------------------------------------------------------
# Drag floating layouts
# --------------------------------------------------------

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

# --------------------------------------------------------
# Define floating layouts
# --------------------------------------------------------

floating_layout = layout.Floating(
    border_width=3,
    border_focus=ColorE,
    border_normal="FFFFFF",
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)

# --------------------------------------------------------
# General Setup
# --------------------------------------------------------

dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.

# --------------------------------------------------------
# Windows Manager Name
# --------------------------------------------------------

wmname = "QTILE"

# --------------------------------------------------------
# Hooks
# --------------------------------------------------------

# HOOK startup
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])


