hs.loadSpoon("SpoonInstall")

---------------------
-- SHADE
---------------------

spoon.SpoonInstall:andUse("Shade")
spoon.Shade.shadeTransparency = 0.25
spoon.Shade:bindHotkeys({ toggleShade = { { "cmd", "alt", "ctrl", "shift" }, "h" } })
