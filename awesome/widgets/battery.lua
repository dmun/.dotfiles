local wibox = require("wibox")
local beautiful = require("beautiful")
require("status.battery")

local mybattery = wibox.widget {
    widget = wibox.widget.textbox
}

awesome.connect_signal("status::battery", function(capacity, charging)
    mybattery.font = beautiful.font
    local text = capacity .. "% "

    if (capacity >= 99) then
        text = text .. "    "
    elseif (capacity > 80) then
        text = text .. "    "
    elseif (capacity > 50) then
        text = text .. "    "
    elseif (capacity > 20) then
        text = text .. "    "
    else
        text = text .. "    "
    end

    mybattery.text = text
end)

return mybattery
