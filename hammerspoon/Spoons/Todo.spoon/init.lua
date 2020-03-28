--- === Calendar ===
---
--- A calendar inset into the desktop
---
--- Download: [https://github.com/Hammerspoon/Spoons/raw/master/Spoons/Calendar.spoon.zip](https://github.com/Hammerspoon/Spoons/raw/master/Spoons/Calendar.spoon.zip)

local obj={}
obj.__index = obj

-- Metadata
obj.name = "Todo"
obj.version = "1.0"
obj.author = "GeekerHua <geekerhua@gmail.com>"
obj.homepage = "https://github.com/Geekerhua/SpoonsTodo"
obj.license = "MIT - https://opensource.org/licenses/MIT"

obj.watch_paths = { "/Users/geekerhua/Documents/Alfred/todos/todo.txt" }

obj.calw = 300
obj.calh = 400

function obj:start()
    local finishedcolor = {red=1, blue=1, green=1, alpha=0.3}
    local calcolor = {red=235/255, blue=235/255, green=235/255}
    local calbgcolor = {red=0, blue=0, green=0, alpha=0.3}
    local weeknumcolor = {red=246/255, blue=246/255, green=246/255, alpha=0.5}
    local cscreen = hs.screen.mainScreen()
    local cres = cscreen:fullFrame()

    -- local todoList = hs.json.read('/Users/geekerhua/Code/code_profile/hammerspoon/Spoons/Todo.spoon/todo.json')
    local todoList = hs.json.read('~/Documents/Alfred/todos/todo.txt')

    obj.canvas = hs.canvas.new({
        x = 20,
        y = 50,
        w = obj.calw,
        h = obj.calh
    }):show()

    obj.canvas:behavior(hs.canvas.windowBehaviors.canJoinAllSpaces)
    obj.canvas:level(hs.canvas.windowLevels.desktopIcon)

    obj.canvas[1] = {
        id = "cal_bg",
        type = "rectangle",
        action = "fill",
        fillColor = calbgcolor,
        roundedRectRadii = {xRadius = 10, yRadius = 10},
    }

    obj.canvas[2] = {
        id = "cal_title",
        type = "text",
        text = "TODO",
        textFont = "Courier",
        textSize = 16,
        textColor = calcolor,
        textAlignment = "center",
        frame = {
            x = tostring(10/obj.calw),
            y = 20,
            w = tostring(1-20/obj.calw),
            h = tostring((obj.calh-20)/8/obj.calh)
        }
    }

    for i,v in ipairs(todoList) do
        local textColor = calcolor
        if v.status == 'done' then
            textColor = finishedcolor
        end
        obj.canvas[2+i] = {
            id = "item",
            type = "text",
            text = i..' '..v.title,
            textFont = "Courier",
            textSize = 16,
            textColor = textColor,
            textAlignment = "left",
            frame = {
                x = 20,
                y = 20 + 28 * i,
                w = obj.calw - 20,
                h = tostring((obj.calh-20)/8/obj.calh)
            }
        }
    end
    return self
end

function obj:init()
    self.start()
    self.watchers = {}
    for _,dir in pairs(self.watch_paths) do
        self.watchers[dir] = hs.pathwatcher.new(dir, hs.reload):start()
    end
    return self
end

return obj
