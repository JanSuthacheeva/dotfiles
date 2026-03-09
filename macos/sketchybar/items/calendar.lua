local settings = require("settings")
local colors = require("colors")

local cal = sbar.add("item", "cal", {
    update_freq = 30,
    position = "left",
    icon = {
        drawing = false
    },
    label = {
        string = "??:??  ??, ??",
        color = colors.black,
        padding_left = 10,
        padding_right = 10,
        font = {
            family = settings.font.numbers,
            style = settings.font.style_map["Bold"],
            size = 13.0
        }
    },
    padding_left = 5,
    padding_right = 8,
    background = {
        color = colors.pill_green,
        corner_radius = settings.items.corner_radius,
        height = settings.items.height,
        border_width = 0,
    }
})

cal:subscribe({"forced", "routine", "system_woke"}, function(env)
    cal:set({
        label = os.date("%H:%M  %d.%m")
    })
end)
