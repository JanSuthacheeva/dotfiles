local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local layout_map = {
    ["ABC"]                 = "ENG",
    ["ABC-QWERTZ"]          = "DEU",
    ["US"]                  = "ENG",
    ["USInternational-PC"]  = "ENG",
    ["British"]             = "ENG",
    ["Australian"]          = "ENG",
    ["German"]              = "DEU",
    ["German-DIN-2137"]     = "DEU",
    ["Thai"]                = "THA",
    ["Thai-PattaChote"]     = "THA",
}

-- Input source (rightmost pill: rounded right edge)
local input_source = sbar.add("item", "widgets.input_source", {
    position = "right",
    icon = {
        string = icons.keyboard,
        font = {
            style = settings.font.style_map["Regular"],
            size = 16.0
        },
        color = colors.black,
        padding_left = 8,
        padding_right = 4,
    },
    label = {
        string = "...",
        color = colors.black,
        font = {
            family = settings.font.numbers,
            style = settings.font.style_map["Bold"],
            size = 13.0,
        },
        padding_right = 8,
    },
    padding_left = 0,
    padding_right = 0,
    background = {
        color = colors.pill_green,
        height = settings.items.height,
        corner_radius = settings.items.corner_radius,
        border_width = 0,
    },
})

local function update_input_source()
    sbar.exec(
        "defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources 2>/dev/null | grep 'KeyboardLayout Name' | head -1 | sed 's/.*= \"\\{0,1\\}\\([^\"]*\\)\"\\{0,1\\};/\\1/' | tr -d ' '",
        function(result)
            local layout = result:gsub("%s+", "")
            local display = layout_map[layout] or layout:sub(1, 3):upper()
            input_source:set({ label = display })
        end
    )
end

-- Register a custom event that can be triggered externally
sbar.add("event", "input_source_change")

-- Poll every 2 seconds as fallback, and react to app switches + custom event
input_source:set({ update_freq = 2 })
input_source:subscribe({"routine", "forced", "front_app_switched", "input_source_change"}, function()
    update_input_source()
end)
