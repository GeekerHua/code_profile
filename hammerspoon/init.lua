require "modules.weather"
require "modules.windows"

hs.loadSpoon("CircleClock")
hs.loadSpoon("BingDaily")
hs.loadSpoon("Calendar")
hs.loadSpoon("MenubarFlag")
-- hs.loadSpoon("HCalendar")

spoon.MenubarFlag:start()
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
