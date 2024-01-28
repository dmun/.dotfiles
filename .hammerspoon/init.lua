local lastCtrl = nil
local combo = false
local expired = true
local timer = hs.timer.delayed.new(0.2, function()
    expired = true
end)

hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, function(evt)
    local ctrl = evt:getFlags()["ctrl"]

    if ctrl == lastCtrl then
        return
    end

    if ctrl then
        combo = false
        expired = false
        timer:start()
    elseif lastCtrl then
        if not (combo or expired) then
            hs.eventtap.keyStroke({}, "escape", 0)
        end
        timer:stop()
    end

    lastCtrl = ctrl
end):start()

hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(evt)
    combo = true
end):start()
