local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

widget_padding = 10
widget_spacing = 3

-- Widgets
local mybattery = require("widgets.battery")
local mynetwork = require("widgets.network")

-- Create a textclock widget
local mytextclock = {
    format = "%a %d %b %H:%M",
    widget = wibox.widget.textclock
}
-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )


local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        -- gears.wallpaper.maximized(wallpaper, s, true)
        gears.wallpaper.set("#101010")
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)


    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(24) })

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        style = {
            shape = function(cr, width, height) gears.shape.rounded_rect(cr, width, height, 5) end,
        },
        layout = {
            spacing = 0,
            layout = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    id = 'text_role',
                    widget = wibox.widget.textbox
                },
                left = 12,
                right = 12,
                widget = wibox.container.margin
            },
            id = 'background_role',
            widget = wibox.container.background
        },
        buttons = taglist_buttons
    }

    s.widgets = {
        mybattery,
        mynetwork,
        mytextclock
    }

    s.right_bar = { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        {
            wibox.widget.systray(),
            top = 2,
            bottom = 2,
            right = widget_padding,
            widget = wibox.container.margin
        }
    }

    for i,v in ipairs(s.widgets) do
        print(type(v))
        s.right_bar[#s.right_bar+1] = ({{{
                    v,
                    left = widget_padding,
                    right = widget_padding,
                    widget = wibox.container.margin
                },
                -- bg = "#295a5f",
                shape = function(cr, width, height) gears.shape.rounded_rect(cr, width, height, 5) end,
                widget = wibox.container.background
            },
            left = widget_spacing,
            right = widget_spacing,
            widget = wibox.container.margin
        })
    end

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            {
                {
                    s.mytaglist,
                    widget = wibox.container.background
                },
                margins = 0,
                widget = wibox.container.margin
            },
            s.mypromptbox,
        },
        {
            layout = wibox.layout.align.horizontal,
        },
        s.right_bar
    }

    return s.mywibox
end)
