local M = {}

function M:init()
	self.reload = hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
		hs.reload()
	end)

	-- self.reload = hs.hotkey.bind({ "ctrl" }, "j", function()
	-- 	hs.eventtap.keyStroke({}, "escape", 0)
	-- end)
end

return M
