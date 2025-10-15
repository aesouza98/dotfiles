---------------------------
-- Default awesome theme --
---------------------------

local gfs                  = require("gears.filesystem")
local themes_path          = gfs.get_configuration_dir() .. "/themes/default"

local theme                = {}
theme.wallpaper            = themes_path .. "/wall.png"

-- Fonts & Wallpaper
theme.font                 = "JetBrainsMono NerdFont 11"

-- Background
theme.bg_normal            = "#181926"
theme.bg_alt               = "#373B41"

-- Foreground
theme.fg_normal            = "#dce0e8"
theme.fg_focus             = "#dce0e8"
theme.fg_urgent            = "#ed8796"
theme.fg_minimize          = "#979EAB"
theme.fg_alt               = "#8aadf4"
theme.fg_dim               = "#535C6E"

-- Accent Color
theme.fg_accent            = "#8FBCBB"

-- Tooltips
theme.tooltip_bg           = theme.bg_normal
theme.tooltip_fg           = theme.fg_normal

-- Taglist
theme.taglist_fg_focus     = "#04a5e5"
-- theme.taglist_fg_focus     = "#1e2030"
-- theme.taglist_bg_focus     = "#1e2030"
theme.taglist_fg_occupied  = "#9ca0b0"
theme.taglist_fg_empty     = "#5c5f79"
theme.taglist_spacing      = 10

-- Gaps and Borders
theme.useless_gap          = 5
theme.border_width         = 2
theme.border_normal        = theme.bg_normal
theme.border_focus         = theme.fg_alt
theme.border_marked        = "#ccd0d0"

-- Systray
theme.bg_systray           = theme.bg_normal
theme.systray_icon_spacing = 5

-- Layout icons
theme.layout_floating      = themes_path .. "/layouts/floatingw.png"
theme.layout_max           = themes_path .. "/layouts/maxw.png"
theme.layout_tile          = themes_path .. "/layouts/tilew.png"

return theme
