local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

widget_padding = 12

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


wibar = {}

function wibar.get(s)
    -- Create the wibox
    s.mywibox = awful.wibar({
        position = "top",
        screen = s,
        height = dpi(24),
        -- border_width = 2,
        -- border_color = "#2d333f"
    })

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        -- style = {
        --     shape = function(cr, width, height) gears.shape.rounded_rect(cr, width, height, 5) end,
        -- },
        layout = {
            spacing = 0,
            layout = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                nil,
                {
                    {
                        id = 'text_role',
                        widget = wibox.widget.textbox
                    },
                    left = 8,
                    right = 8,
                    widget = wibox.container.margin
                },
                {
                    {
                        widget = wibox.container.background
                    },
                    bg = "#0077ca",
                    forced_height = 0,
                    widget = wibox.container.background
                },
                layout = wibox.layout.align.vertical
            },
            id = 'background_role',
            widget = wibox.container.background
        },
        buttons = taglist_buttons
    }

    s.widgets = {
        -- mybattery,
        mynetwork,
        mytextclock
    }

    s.right_bar = { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        {
            wibox.widget.systray(),
            top = dpi(2),
            bottom = dpi(2),
            right = widget_padding,
            widget = wibox.container.margin
        }
    }

    for i,v in ipairs(s.widgets) do
        print(type(v))
        s.right_bar[#s.right_bar+1] = ({{
                v,
                left = widget_padding,
                right = widget_padding,
                widget = wibox.container.margin
            },
            -- bg = "#cccccc22",
            shape = function(cr, width, height) gears.shape.rounded_rect(cr, width, height, 5) end,
            widget = wibox.container.background
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
                left = 20,
                right = 10,
                widget = wibox.container.margin
            },
            s.mypromptbox,
        },
        {
            layout = wibox.layout.align.horizontal,
        },
        {
            s.right_bar,
            right = 10,
            widget = wibox.container.margin
        }
    }

    return s.mywibox
end

return wibar
