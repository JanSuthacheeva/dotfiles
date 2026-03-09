local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

-- Start the cpu_load event provider (fires cpu_update every 2s)
sbar.exec("killall cpu_load >/dev/null; $CONFIG_DIR/helpers/event_providers/cpu_load/bin/cpu_load cpu_update 2.0")

local stat_icon_font = {
    family = settings.font.text,
    style = settings.font.style_map["Regular"],
    size = 14.0
}

local stat_label_font = {
    family = settings.font.numbers,
    style = settings.font.style_map["Bold"],
    size = 12.0
}

-- CPU (first: rounded left edge, overlap right)
local cpu_stat = sbar.add("item", "stats.cpu", {
    position = "left",
    icon = {
        string = icons.cpu,
        font = stat_icon_font,
        color = colors.black,
        padding_left = 8,
        padding_right = 2,
    },
    label = {
        string = "?%",
        font = stat_label_font,
        color = colors.black,
        padding_right = 10,
    },
    padding_left = 0,
    padding_right = -4,
    background = {
        color = colors.pill_cpu,
        height = 26,
        corner_radius = 6,
        border_width = 0,
    },
})

-- Memory (middle: no rounding, overlaps neighbors)
local mem_stat = sbar.add("item", "stats.mem", {
    position = "left",
    icon = {
        string = icons.memory,
        font = stat_icon_font,
        color = colors.black,
        padding_left = 8,
        padding_right = 2,
    },
    label = {
        string = "?%",
        font = stat_label_font,
        color = colors.black,
        padding_right = 10,
    },
    update_freq = 10,
    padding_left = 0,
    padding_right = -4,
    background = {
        color = colors.pill_mem,
        height = 26,
        corner_radius = 0,
        border_width = 0,
    },
})

-- Disk (middle: no rounding, overlaps neighbors)
local disk_stat = sbar.add("item", "stats.disk", {
    position = "left",
    icon = {
        string = icons.disk,
        font = stat_icon_font,
        color = colors.black,
        padding_left = 8,
        padding_right = 2,
    },
    label = {
        string = "?%",
        font = stat_label_font,
        color = colors.black,
        padding_right = 10,
    },
    update_freq = 60,
    padding_left = 0,
    padding_right = -4,
    background = {
        color = colors.pill_disk,
        height = 26,
        corner_radius = 0,
        border_width = 0,
    },
})

-- Temperature (last: rounded right edge)
local temp_stat = sbar.add("item", "stats.temp", {
    position = "left",
    icon = {
        string = icons.temp,
        font = stat_icon_font,
        color = colors.black,
        padding_left = 8,
        padding_right = 2,
    },
    label = {
        string = "?°C",
        font = stat_label_font,
        color = colors.black,
        padding_right = 8,
    },
    update_freq = 10,
    padding_left = 0,
    padding_right = 0,
    background = {
        color = colors.pill_temp,
        height = 26,
        corner_radius = 6,
        border_width = 0,
    },
})

-- Padding after stats group
sbar.add("item", {
    position = "left",
    width = 5
})

-- CPU updates from event provider
cpu_stat:subscribe("cpu_update", function(env)
    cpu_stat:set({ label = env.total_load .. "%" })
end)

-- Memory updates periodically
mem_stat:subscribe({"routine", "forced"}, function()
    sbar.exec(
        "p=$(pagesize) && a=$(vm_stat | awk '/Pages active/{print int($3)}') && w=$(vm_stat | awk '/Pages wired/{print int($4)}') && t=$(sysctl -n hw.memsize) && echo $(( (a+w)*p*100/t ))",
        function(result)
            local mem = result:gsub("%s+", "")
            mem_stat:set({ label = mem .. "%" })
        end
    )
end)

-- Disk updates periodically
disk_stat:subscribe({"routine", "forced"}, function()
    sbar.exec("df -h / | awk 'NR==2{print $5}'", function(result)
        local disk = result:gsub("%s+", "")
        disk_stat:set({ label = disk })
    end)
end)

-- Temperature updates periodically (requires osx-cpu-temp)
temp_stat:subscribe({"routine", "forced"}, function()
    sbar.exec("/opt/homebrew/bin/smctemp -c 2>/dev/null | awk '{printf \"%.0f\", $1}'", function(result)
        local temp = result:gsub("%s+", "")
        if temp == "" then
            temp_stat:set({ label = "N/A" })
        else
            temp_stat:set({ label = temp .. "°C" })
        end
    end)
end)
