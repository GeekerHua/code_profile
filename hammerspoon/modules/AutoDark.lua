sizeRect = hs.geometry.rect(0, 0, hs.screen.mainScreen():fullFrame().w, hs.screen.mainScreen():fullFrame().h)
drawObj = hs.drawing.rectangle(sizeRect)
drawObj:setFillColor(hs.drawing.color.asRGB({red=0.1, green=0.1, blue= 0.1, alpha=0.5}))
drawObj:setLevel(hs.drawing.windowLevels.desktopIcon)

brightTimer = hs.timer.new(5, function ()
    if hs.brightness.get() < 30 then
        hs.osascript.applescript('tell application "System Events" to tell appearance preferences to set dark mode to true')
        drawObj:show()
    else
        hs.osascript.applescript('tell application "System Events" to tell appearance preferences to set dark mode to false')
        drawObj:hide()
    end
end, true)
brightTimer:start()
