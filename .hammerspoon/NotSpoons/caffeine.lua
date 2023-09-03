---------------------
-- CAFFEINE
---------------------
local caffeineOn = false
local toggleCaffeine = function()
	if not spoon.Caffeine then
		spoon.SpoonInstall:andUse("Caffeine")
	end
	caffeineOn = not caffeineOn
	spoon.Caffeine:setState(caffeineOn)
end
hs.hotkey.new({ "cmd", "alt", "ctrl", "shift" }, "c", toggleCaffeine):enable()
-- spoon.Caffeine.clicked()
