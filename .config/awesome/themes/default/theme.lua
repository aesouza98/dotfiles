--[[

     Multicolor Awesome WM theme 2.0
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/default"

theme.font                                      = "JetBrainsMono NerdFont 10"
theme.taglist_font                              = "JetBrainsMono NerdFont 10"
theme.bg_normal                                 = "#161616B5"
theme.bg_urgent                                 = "#161616B5"
theme.bg_minimize                               = "#DDDADAFF"
theme.bg_systray                                = theme.bg_normal
theme.fg_normal                                 = "#acb0b0"
theme.fg_focus                                  = "#E8E3E3"
theme.fg_urgent                                 = "#ff7a93"
theme.fg_minimize                               = "#acb0b0"
theme.tooltip_bg                                = "#161616DD"
theme.tooltip_fg                                = theme.fg_normal
theme.taglist_fg_focus                          = "#CCD0D0"
theme.taglist_fg_occupied                       = "#686c69"
theme.taglist_fg_empty                          = "#343b3a"
theme.taglist_spacing                           = 5
theme.useless_gap                               = 2
theme.border_width                              = 1
theme.menu_height                               = 20
theme.menu_width                                = 140
theme.border_normal                             = "#161616B5"
theme.border_focus                              = "#acb0b0"
theme.border_marked                             = "#ccd0d0"

theme.menu_submenu_icon                         = theme.confdir .. "/icons/submenu.png"
theme.menu_fg_normal                            = "#acb0b0"
theme.menu_fg_focus                             = "#CCD0D0"
theme.menu_bg_normal                            = "#161616B5"
theme.menu_bg_focus                             = "#161616B5"
-- theme.taglist_squares_sel                       = theme.confdir .. "/icons/square_a.png"
-- theme.taglist_squares_unsel                     = theme.confdir .. "/icons/square_b.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.layout_tile                               = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps                           = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft                           = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.confdir .. "/icons/dwindle.png"
theme.layout_max                                = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.confdir .. "/icons/floating.png"

local markup = lain.util.markup

-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock
-- local clockicon = wibox.widget.imagebox(theme.widget_clock)
local mytextclock = wibox.widget.textclock(markup("#acb0b0", "%a, %d %b ") .. markup("#acb0b0", ">") .. markup("#acb0b0", " %H:%M "))
mytextclock.font = theme.font

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        font = "JetBrainsMono NerdFont 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- Separator
local separator = wibox.widget.textbox("  ")
local separator1 = wibox.widget.textbox("  ")

-- Clock Widget
-- local wdg_clock = wibox.widget.textclock()

-- Systray Widget
local wdg_systray = wibox.widget.systray()
wdg_systray:set_base_size(20)

-- Mic widget
local cmd_mic = os.getenv("HOME") .. "/.config/scripts/micstatus"
local wdg_mic = awful.widget.watch(cmd_mic,1)
wdg_mic:buttons(gears.table.join(
    wdg_mic:buttons(),
    awful.button({}, 1, nil, function()
        awful.spawn(os.getenv("HOME") .. "/.local/bin/micvolume mute")
    end),
    awful.button({}, 3, nil, function()
        awful.spawn(os.getenv("HOME") .. "pavucontrol")
    end),
    awful.button({}, 4, nil, function()
        awful.spawn(os.getenv("HOME") .. "/.local/bin/micvolume up")
    end),
    awful.button({}, 5, nil, function()
        awful.spawn(os.getenv("HOME") .. "/.local/bin/micvolume down")
    end)
))

-- Volume Widget
local cmd_vol = os.getenv("HOME") .. "/.config/scripts/volstatus"
local wdg_vol = awful.widget.watch(cmd_vol,1)
wdg_vol:buttons(gears.table.join(
    wdg_vol:buttons(),
    awful.button({}, 1, nil, function()
        awful.spawn(os.getenv("HOME") .. "/.local/bin/changevolume mute")
    end),
    awful.button({}, 3, nil, function()
        awful.spawn(os.getenv("HOME") .. "pavucontrol")
    end),
    awful.button({}, 4, nil, function()
        awful.spawn(os.getenv("HOME") .. "/.local/bin/changevolume up")
    end),
    awful.button({}, 5, nil, function()
        awful.spawn(os.getenv("HOME") .. "/.local/bin/changevolume down")
    end)
))


-- Brightness Widget
local cmd_bright = "/.config/scripts/bright_status"
local wdg_bright = awful.widget.watch(cmd_bright,1)
wdg_bright:buttons(gears.table.join(
    wdg_bright:buttons(),
    awful.button({}, 1, nil, function()
        awful.spawn(os.getenv("HOME") .. "redshift -P -O 4000")
    end),
    awful.button({}, 3, nil, function()
        awful.spawn(os.getenv("HOME") .. "redshift -x")
    end),
    awful.button({}, 4, nil, function()
        awful.spawn(os.getenv("HOME") .. "/.local/bin/brightness up")
    end),
    awful.button({}, 5, nil, function()
        awful.spawn(os.getenv("HOME") .. "/.local/bin/brightness down")
    end)
))

-- Spotify Widget
local wdg_spotify = require("widgets.spotify-widget.spotify"){
    font = theme.font,
    dim_when_paused = true,
    dim_opacity = 0.5,
    max_length = -1,
    show_tooltip = true
}

-- Wireless
local cmd_wifi = "/.config/scripts/wifi_status"
local wdg_wifi = awful.widget.watch(cmd_wifi,5)
wdg_wifi:buttons(gears.table.join(
    wdg_wifi:buttons(),
    awful.button({}, 1, nil, function()
        awful.spawn(os.getenv("HOME") .. "wifimenu")
    end)
))

-- Battery Widget
local wdg_battery = require("widgets.battery"){
    ac = "AC",
    adapter = "BAT0",
    ac_prefix = " ",
    battery_prefix = {
        { 25, "  "},
        { 50, "  "},
        { 75, "  "},
        {100, "  "}
    },
    percent_colors = {
        { 25, "red"   },
        { 50, "#E8E3E3"},
        {999, "#E8E3E3" },
    },
    listen = true,
    timeout = 10,
    widget_text = "${AC_BAT}${percent}%",
    tooltip_text = "Battery ${state}${time_est}\nCapacity: ${capacity_percent}%",
    alert_threshold = 5,
    alert_timeout = 0,
    alert_title = "Low battery !",
    alert_text = "${AC_BAT}${time_est}"
}

-- local batt = ("widgets.batteru-widget.battery")

function theme.at_screen_connect(s)
    -- Quake application
   -- s.quake = lain.util.quake({ app = awful.util.terminal })
   s.quake = lain.util.quake({ app = "urxvt", height = 0.50, argname = "--name %s" })

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(20)})

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.stack,
        {
            layout = wibox.layout.align.horizontal,
            expand = none,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                spacing = 3,
                s.mylayoutbox,
                s.mytaglist,
                separator,
                wdg_spotify,
            },
            nil,
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                spacing = 5,
                wdg_mic,
                separator1,
                wdg_vol,
                separator1,
                wdg_systray,
            }
        },
        { -- Center widgets
            mytextclock,
            layout = wibox.container.place,
            valign = "center",
            halign = "center",
        }
    }

end

return theme
