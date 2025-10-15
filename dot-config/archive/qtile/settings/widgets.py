from libqtile import widget
from .theme import colors
from .spotify import Spotify

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)

def base(fg='text', bg='dark'): 
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }

def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)

def separator2():
    return widget.Sep(**base(), linewidth=0, padding=20)

def spacer():
    return widget.Spacer(**base(fg='dark')),

def icon(fg='text', bg='dark', fontsize=16, text="?"):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=3
    )

def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
        text="", # Icon: nf-oct-triangle_left
        fontsize=37,
        padding=-2
    )

def workspaces(): 
    return [
        separator(),
        widget.GroupBox(
            **base(fg='light'),
            font='JetBrainsMonoNL Nerd Font',
            fontsize=12,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            active=colors['active'],
            inactive=colors['inactive'],
            rounded=False,
            invert_mouse_wheel=True,
            highlight_method='line',
            highlight_color=colors['dark'],
            urgent_alert_method='block',
            urgent_border=colors['urgent'],
            this_current_screen_border=colors['focus'],
            this_screen_border=colors['grey'],
            other_current_screen_border=colors['color4'],
            other_screen_border=colors['color4'],
            disable_drag=True
        ),
    #    separator(),
    #    widget.WindowName(**base(fg='focus'), fontsize=14, padding=5),
    #    separator(),
    ]

def volume():
    return [
        separator2(),
        widget.PulseVolume(
            **base(fg='color3', bg='dark'),
            fmt=' {}',
            limit_max_volume=True,
            update_interval=0,
        ),
    ]

def battery():
    return[
        separator2(),
        widget.Battery(
            **base(fg='color4', bg='dark'),
            format='{char} {percent:2.0%}',
            charge_char='',
            discharge_char=' ',
            empty_char='',
        ),
    ]

def wlan():
    return[
        separator2(),
        widget.Wlan(
            **base(fg='color2'),
            format='{essid}',
            fmt='  {}',
            disconnected_message='disconnected',
        ),
    ]

def spotify():
    return[
        separator(),
        Spotify(
            background=colors['dark'],
            foreground=colors['color1'],
            format='{icon} {artist} - {track}',
        ),
    ]

def updates():
    return[
        separator2(),
        widget.CheckUpdates(
            colour_have_updates=colors['color3'],
            colour_no_updates=colors['color4'],
            background=colors['dark'],
            fmt=' {}',
            no_update_string='0',
            display_format='{updates}',
            update_interval=1800,
            custom_command='checkupdates',
        ),
    ]

primary_widgets = [
    widget.CurrentLayoutIcon(**base(fg='color2'), scale=0.65),

    #widget.CurrentLayout(**base(fg='color2'), padding=5),

    *workspaces(),

    *spotify(),

    *spacer(),

    icon(fg="color1", fontsize=17, text=' '), # Icon: nf-mdi-calendar_clock

    widget.Clock(**base(fg='color1'), format='%d/%m/%Y > %H:%M'),

    *spacer(),

    #icon(fg="color4", text=' '), # Icon: nf-fa-download

    *updates(),
    
    *wlan(),

    *battery(),

    *volume(),

    separator(),

    widget.Systray(background=colors['dark'], padding=5),
]

secondary_widgets = [
    widget.CurrentLayoutIcon(**base(fg='color1'), scale=0.65),
    *workspaces(),

    *spotify(),

    *spacer(),

    widget.Clock(**base(fg='color2'), format='%d/%m/%Y > %H:%M'),

    *spacer(),

    separator2(),

    *wlan(),

    *battery(),

    *volume(),

    #widget.CurrentLayout(**base(fg='color1'), padding=5),
]

widget_defaults = {
    'font': 'JetBrainsMonoNL Nerd Font',
    'fontsize': 14,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()
