local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

-- Battery (leftmost pill: rounded left edge)
local battery = sbar.add("item", "widgets.battery", {
    position = "right",
    icon = {
        font = {
            style = settings.font.style_map["Regular"],
            size = 19.0
        },
        color = colors.black,
        padding_left = 8,
        padding_right = 2,
    },
    label = {
        font = {
            family = settings.font.numbers,
            style = settings.font.style_map["Bold"],
            size = 13.0,
        },
        color = colors.black,
        padding_right = 10,
    },
    padding_left = 0,
    padding_right = -4,
    update_freq = 180,
    background = {
        color = colors.pill_rose,
        height = settings.items.height,
        corner_radius = settings.items.corner_radius,
        border_width = 0,
    },
    popup = {
        align = "center"
    }
})

local remaining_time = sbar.add("item", {
    position = "popup." .. battery.name,
    icon = {
        string = "Time remaining:",
        width = 100,
        align = "left"
    },
    label = {
        string = "??:??h",
        width = 100,
        align = "right"
    }
})

battery:subscribe({"routine", "power_source_change", "system_woke"}, function()
    sbar.exec("pmset -g batt", function(batt_info)
        local icon = "!"
        local label = "?"

        local found, _, charge = batt_info:find("(%d+)%%")
        if found then
            charge = tonumber(charge)
            label = charge .. "%"
        end

        local charging, _, _ = batt_info:find("AC Power")

        if charging then
            icon = icons.battery.charging
        else
            if found and charge > 80 then
                icon = icons.battery._100
            elseif found and charge > 60 then
                icon = icons.battery._75
            elseif found and charge > 40 then
                icon = icons.battery._50
            elseif found and charge > 20 then
                icon = icons.battery._25
            else
                icon = icons.battery._0
            end
        end

        local lead = ""
        if found and charge < 10 then
            lead = "0"
        end

        battery:set({
            icon = {
                string = icon,
            },
            label = {
                string = lead .. label
            }
        })
    end)
end)

battery:subscribe("mouse.clicked", function(env)
    local drawing = battery:query().popup.drawing
    battery:set({
        popup = {
            drawing = "toggle"
        }
    })

    if drawing == "off" then
        sbar.exec("pmset -g batt", function(batt_info)
            local found, _, remaining = batt_info:find(" (%d+:%d+) remaining")
            local label = found and remaining .. "h" or "No estimate"
            remaining_time:set({
                label = label
            })
        end)
    end
end)
