local M = {}

M.last_ctrl = nil
M.combo = false
M.expired = true
M.timer = hs.timer.delayed.new(0.2, function()
	M.expired = true
end)

function M:init()
	self.ctrl_eventtap = hs.eventtap
		.new({ hs.eventtap.event.types.flagsChanged }, function(evt)
			local ctrl = evt:getFlags()["ctrl"]

			if ctrl == M.last_ctrl then
				return
			end

			if ctrl then
				M.combo = false
				M.expired = false
				M.timer:start()
			elseif M.last_ctrl then
				if not (M.combo or M.expired) then
					hs.eventtap.keyStroke({}, "escape", 0)
				end
			end

			M.last_ctrl = ctrl
		end)
		:start()

	self.combo_eventtap = hs.eventtap
		.new({ hs.eventtap.event.types.keyDown }, function(_)
			M.combo = true
		end)
		:start()
end

return M
