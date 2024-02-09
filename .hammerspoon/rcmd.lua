local M = {}

function M:init()
    local apps = hs.application.runningApplications()
    for index, value in ipairs(apps) do
        print(value)
    end
end

return M
