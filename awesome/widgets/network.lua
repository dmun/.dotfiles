local wibox = require("wibox")
local beautiful = require("beautiful")
require("status.network")

local mynetwork = wibox.widget {
    widget = wibox.widget.textbox
}

awesome.connect_signal("status::network", function(state)
    mynetwork.font = beautiful.font
    local text

    if (state == "UP") then
        text = ""
    else
        text = "睊"
    end

    mynetwork.text = text
end)

return mynetwork
