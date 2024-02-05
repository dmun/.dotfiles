local M = {}

function M:init()
	self.reload = hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
		hs.reload()
	end)
end

return M
