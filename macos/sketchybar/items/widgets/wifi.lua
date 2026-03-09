local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local popup_width = 250

local wifi_icon = sbar.add("item", "widgets.wifi.icon", {
    position = "right",
    icon = {
        string = icons.wifi.connected,
        color = colors.black,
        font = {
            style = settings.font.style_map["Regular"],
            size = 14.0
        },
        padding_left = 4,
        padding_right = 8,
    },
    label = { drawing = false },
    padding_left = 0,
    padding_right = 0,
})

local wifi_name = sbar.add("item", "widgets.wifi.name", {
    position = "right",
    icon = { drawing = false },
    label = {
        string = "Wi-Fi",
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

local wifi_bracket = sbar.add("bracket", "widgets.wifi.bracket",
    { wifi_name.name, wifi_icon.name }, {
    background = {
        color = colors.pill_purple,
        corner_radius = settings.items.corner_radius,
        height = settings.items.height,
        border_width = 0,
    },
    popup = {
        align = "center",
        height = 30
    }
})

sbar.add("item", "widgets.wifi.padding", {
    position = "right",
    width = settings.group_paddings
})

-- Popup details
local ssid = sbar.add("item", {
    position = "popup." .. wifi_bracket.name,
    icon = {
        font = { style = settings.font.style_map["Bold"] },
        string = icons.wifi.router
    },
    width = popup_width,
    align = "center",
    label = {
        font = { size = 15, style = settings.font.style_map["Bold"] },
        max_chars = 18,
        string = "..."
    },
    background = {
        height = 2,
        color = colors.grey,
        y_offset = -15
    }
})

local hostname = sbar.add("item", {
    position = "popup." .. wifi_bracket.name,
    icon = { align = "left", string = "Hostname:", width = popup_width / 2 },
    label = { max_chars = 20, string = "...", width = popup_width / 2, align = "right" }
})

local ip = sbar.add("item", {
    position = "popup." .. wifi_bracket.name,
    icon = { align = "left", string = "IP:", width = popup_width / 2 },
    label = { string = "...", width = popup_width / 2, align = "right" }
})

local mask = sbar.add("item", {
    position = "popup." .. wifi_bracket.name,
    icon = { align = "left", string = "Subnet mask:", width = popup_width / 2 },
    label = { string = "...", width = popup_width / 2, align = "right" }
})

local router = sbar.add("item", {
    position = "popup." .. wifi_bracket.name,
    icon = { align = "left", string = "Router:", width = popup_width / 2 },
    label = { string = "...", width = popup_width / 2, align = "right" }
})

-- Update SSID on wifi change
local function update_wifi_info()
    sbar.exec("ipconfig getifaddr en0", function(ip_result)
        local connected = not (ip_result == "")
        wifi_icon:set({
            icon = {
                string = connected and icons.wifi.connected or icons.wifi.disconnected,
                color = connected and colors.white or colors.red
            }
        })
    end)
    sbar.exec("ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}'", function(result)
        local name = result:gsub("%s+$", "")
        if name == "" then name = "Wi-Fi" end
        wifi_name:set({ label = name })
    end)
end

wifi_icon:subscribe({"wifi_change", "system_woke", "forced"}, function()
    update_wifi_info()
end)

wifi_name:subscribe({"wifi_change", "system_woke", "forced"}, function()
    update_wifi_info()
end)

-- Popup toggle
local function hide_details()
    wifi_bracket:set({ popup = { drawing = false } })
end

local function toggle_details()
    local should_draw = wifi_bracket:query().popup.drawing == "off"
    if should_draw then
        wifi_bracket:set({ popup = { drawing = true } })
        sbar.exec("networksetup -getcomputername", function(result)
            hostname:set({ label = result })
        end)
        sbar.exec("ipconfig getifaddr en0", function(result)
            ip:set({ label = result })
        end)
        sbar.exec("ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}'", function(result)
            ssid:set({ label = result })
        end)
        sbar.exec("networksetup -getinfo Wi-Fi | awk -F 'Subnet mask: ' '/^Subnet mask: / {print $2}'", function(result)
            mask:set({ label = result })
        end)
        sbar.exec("networksetup -getinfo Wi-Fi | awk -F 'Router: ' '/^Router: / {print $2}'", function(result)
            router:set({ label = result })
        end)
    else
        hide_details()
    end
end

wifi_icon:subscribe("mouse.clicked", toggle_details)
wifi_name:subscribe("mouse.clicked", toggle_details)
wifi_icon:subscribe("mouse.exited.global", hide_details)

local function copy_label_to_clipboard(env)
    local label = sbar.query(env.NAME).label.value
    sbar.exec("echo \"" .. label .. "\" | pbcopy")
    sbar.set(env.NAME, { label = { string = icons.clipboard, align = "center" } })
    sbar.delay(1, function()
        sbar.set(env.NAME, { label = { string = label, align = "right" } })
    end)
end

ssid:subscribe("mouse.clicked", copy_label_to_clipboard)
hostname:subscribe("mouse.clicked", copy_label_to_clipboard)
ip:subscribe("mouse.clicked", copy_label_to_clipboard)
mask:subscribe("mouse.clicked", copy_label_to_clipboard)
router:subscribe("mouse.clicked", copy_label_to_clipboard)
