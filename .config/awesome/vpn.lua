local wibox = require("wibox")
local awful = require("awful")
local naughty = require("naughty")
local watch = require("awful.widget.watch")

vpn_widget = wibox.widget.textbox()
watch(
    "ip addr show tun0", 2,
    function(widget, stdout, stderr, exitreason, exitcode)
    if(stdout == '' or stdout==nil or stdout=='Device "tun0" does not exist.') then
        widget.text= "| Disconnected |"
    else
        widget.text= "| Connected | " 
    end
end,
vpn_widget
)
