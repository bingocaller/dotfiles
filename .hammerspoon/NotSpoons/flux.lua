---------------------
-- FLUX
---------------------
local message = require("NotSpoons.status-message")
-- Setup Flux message
local fluxActiveMessage = message.new("sunset")
local fluxInactiveMessage = message.new("sunrise")
fluxActiveMessage.hidden = function()
	fluxActiveMessage:hide()
end
fluxInactiveMessage.hidden = function()
	fluxInactiveMessage:hide()
end
local toggleFlux = function()
	local flux = hs.application.get("Flux")
	if flux then
		fluxInactiveMessage:show()
		hs.timer.doAfter(1, fluxInactiveMessage.hidden)
		flux:kill()
		-- hs.alert.show('Killed Flux')
	else
		-- hs.alert.show('Flux')
		fluxActiveMessage:show()
		hs.timer.doAfter(1, fluxActiveMessage.hidden)
		hs.application.launchOrFocus("Flux")
	end
end
hs.hotkey.new({ "cmd", "alt", "ctrl", "shift" }, "l", toggleFlux):enable()
