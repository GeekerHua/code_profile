-- require "modules.weather"
-- require "modules.windows"

-- hs.loadSpoon("CircleClock")
hs.loadSpoon("Calendar")
-- hs.loadSpoon("Todo")
hs.loadSpoon("SpoonInstall")
hs.loadSpoon("BingDaily")
-- hs.loadSpoon("HCalendar")

-- MiroWindowsManager start
local hyper = {"ctrl", "alt", "cmd"}
hs.loadSpoon("MiroWindowsManager")
hs.window.animationDuration = 0.3
spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "up"},
  right = {hyper, "right"},
  down = {hyper, "down"},
  left = {hyper, "left"},
  fullscreen = {hyper, "f"}
})
-- MiroWindowsManager end

hs.loadSpoon("MenubarFlag")
spoon.MenubarFlag:start()

hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
