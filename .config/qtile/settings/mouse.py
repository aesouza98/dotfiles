from libqtile.config import Drag, Click
from libqtile.command import lazy
from .keys import sup


mouse = [
    Drag(
        [sup],
        "Button1",
        lazy.window.set_position(),
        start=lazy.window.get_position()
    ),
    Drag(
        [sup],
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size()
    ),
    Click([sup], "Button2", lazy.window.bring_to_front())
]
