---------------------
-- HYPER BINDINGS
---------------------
local status, hyperModeAppMappings = pcall(require, "NotSpoons.hyper-apps")
local message = require("NotSpoons.status-message")

for i, mapping in ipairs(hyperModeAppMappings) do
	hs.hotkey.bind({ "shift", "ctrl", "alt", "cmd" }, mapping[1], function()
		local appName = mapping[2]
		local appIcon = mapping[3]
		local appIconFont = mapping[4]
		local app = hs.application.find(appName, true)
		if app then
			app:activate()
		else
			-- Setup status message
			local statusMessage = message.new(appIcon, appIconFont)
			-- hs.alert.show('Launching ' .. appName)
			-- hs.alert.show(appName)
			-- Show status message, then hide it
			statusMessage:show()
			hs.application.launchOrFocus(appName)
			hs.timer.doAfter(1, function()
				statusMessage:hide()
			end)
		end
	end)
end
