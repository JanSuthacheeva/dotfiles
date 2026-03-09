local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local layout_map = {
    ["ABC"]                 = "ENG",
    ["US"]                  = "ENG",
    ["USInternational-PC"]  = "ENG",
    ["British"]             = "ENG",
    ["Australian"]          = "ENG",
    ["German"]              = "DEU",
    ["German-DIN-2137"]     = "DEU",
    ["Thai"]                = "THA",
    ["Thai-PattaChote"]     = "THA",
}

local input_label = sbar.add("item", "widgets.input.label", {
    position = "right",
    icon = { drawing = false },
    label = {
        string = "...",
        color = colors.black,
        font = {
            family = settings.font.numbers,
            style = settings.font.style_map["Bold"],
            size = 13.0
        },
        padding_left = 8,
        padding_right = 0,
    },
    padding_left = 0,
    padding_right = 0,
})

local input_icon = sbar.add("item", "widgets.input.icon", {
    position = "right",
    icon = {
        string = icons.keyboard,
        color = colors.black,
        font = {
            style = settings.font.style_map["Regular"],
            size = 16.0
        },
        padding_left = 4,
        padding_right = 8,
    },
    label = { drawing = false },
    padding_left = 0,
    padding_right = 0,
})

sbar.add("bracket", "widgets.input.bracket", { input_label.name, input_icon.name }, {
    background = {
        color = colors.pill_mauve,
        corner_radius = settings.items.corner_radius,
        height = settings.items.height,
        border_width = 0,
    }
})

sbar.add("item", "widgets.input.padding", {
    position = "right",
    width = settings.group_paddings
})

local function update_input_source()
    sbar.exec(
        "defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources 2>/dev/null | grep 'KeyboardLayout Name' | head -1 | sed 's/.*= \"\\{0,1\\}\\([^\"]*\\)\"\\{0,1\\};/\\1/' | tr -d ' '",
        function(result)
            local layout = result:gsub("%s+", "")
            local display = layout_map[layout] or layout:sub(1, 3):upper()
            input_label:set({ label = display })
        end
    )
end

-- Poll every 5 seconds since there's no native input source change event
input_label:set({ update_freq = 5 })
input_label:subscribe({"routine", "forced"}, function()
    update_input_source()
end)
