require "hs.application"
hyper = {"ctrl","cmd"}

local hotkey = require "hs.hotkey"
local window = require "hs.window"

-- 屏幕显示Hello world
hotkey.bind(hyper, "h", function()
  hs.alert("Hello World")
end)

-- 当前窗口全屏
hs.hotkey.bind(hyper, 'up', function()
    hs.grid.maximizeWindow()
end)

-- 当前窗口 2分屏 宽度1/2 左分屏
hs.hotkey.bind(hyper, "Left", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-- 当前窗口 2分屏 宽度1/2 右分屏
hs.hotkey.bind(hyper, "Right", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w/2
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)


-- 当前窗口 4分屏 宽度1/2 高度1/2 左上分屏
hs.hotkey.bind(hyper,"1", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)

-- 当前窗口 4分屏 宽度1/2 高度1/2 左下分屏
hs.hotkey.bind(hyper,"2", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y + max.h/2
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)


-- 当前窗口 4分屏 宽度1/2 高度1/2 右上分屏
hs.hotkey.bind(hyper,"3", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w/2
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)


-- 当前窗口 4分屏 宽度1/2 高度1/2 右下分屏
hs.hotkey.bind(hyper,"4", function()
  local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w/2
    f.y = max.y + max.h/2
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)
