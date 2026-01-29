local icons = require("icons")
local colors = require("colors")
local settings = require("settings")
local json = require("helpers.json")

local popup_width = 200

local function format_number(n)
    if n >= 1000000 then
        return string.format("%.1fM", n / 1000000)
    elseif n >= 1000 then
        return string.format("%.1fK", n / 1000)
    else
        return tostring(n)
    end
end

local function get_today()
    return os.date("%Y-%m-%d")
end

local claude_msgs = sbar.add("item", "widgets.claude1", {
    position = "right",
    padding_left = -5,
    width = 0,
    update_freq = 60,
    icon = {
        padding_right = 0,
        font = {
            style = settings.font.style_map["Bold"],
            size = 9.0
        },
        string = icons.claude.messages
    },
    label = {
        font = {
            family = settings.font.numbers,
            style = settings.font.style_map["Bold"],
            size = 9.0
        },
        color = colors.magenta,
        string = "-- msgs"
    },
    y_offset = 4
})

local claude_tokens = sbar.add("item", "widgets.claude2", {
    position = "right",
    padding_left = -5,
    icon = {
        padding_right = 0,
        font = {
            style = settings.font.style_map["Bold"],
            size = 9.0
        },
        string = icons.claude.tokens
    },
    label = {
        font = {
            family = settings.font.numbers,
            style = settings.font.style_map["Bold"],
            size = 9.0
        },
        color = colors.blue,
        string = "-- tok"
    },
    y_offset = -4
})

local claude = sbar.add("item", "widgets.claude.padding", {
    position = "right",
    label = {
        drawing = false
    }
})

local claude_bracket = sbar.add("bracket", "widgets.claude.bracket", {
    claude.name,
    claude_msgs.name,
    claude_tokens.name
}, {
    background = {
        color = colors.bg1,
        border_color = colors.lightgrey,
        border_width = 1
    },
    popup = {
        align = "center",
        height = 30
    }
})

local popup_title = sbar.add("item", {
    position = "popup." .. claude_bracket.name,
    icon = {
        font = {
            style = settings.font.style_map["Bold"]
        },
        string = icons.claude.logo
    },
    width = popup_width,
    align = "center",
    label = {
        font = {
            size = 15,
            style = settings.font.style_map["Bold"]
        },
        string = "Claude Code Stats"
    },
    background = {
        height = 2,
        color = colors.grey,
        y_offset = -15
    }
})

local popup_sessions = sbar.add("item", {
    position = "popup." .. claude_bracket.name,
    icon = {
        align = "left",
        string = "Sessions today:",
        width = popup_width / 2
    },
    label = {
        string = "--",
        width = popup_width / 2,
        align = "right"
    }
})

local popup_tools = sbar.add("item", {
    position = "popup." .. claude_bracket.name,
    icon = {
        align = "left",
        string = "Tool calls:",
        width = popup_width / 2
    },
    label = {
        string = "--",
        width = popup_width / 2,
        align = "right"
    }
})

local popup_total_msgs = sbar.add("item", {
    position = "popup." .. claude_bracket.name,
    icon = {
        align = "left",
        string = "Total messages:",
        width = popup_width / 2
    },
    label = {
        string = "--",
        width = popup_width / 2,
        align = "right"
    }
})

local popup_total_sessions = sbar.add("item", {
    position = "popup." .. claude_bracket.name,
    icon = {
        align = "left",
        string = "Total sessions:",
        width = popup_width / 2
    },
    label = {
        string = "--",
        width = popup_width / 2,
        align = "right"
    }
})

sbar.add("item", {
    position = "right",
    width = settings.group_paddings
})

local function update_claude_stats()
    local home = os.getenv("HOME")
    local stats_file = home .. "/.claude/stats-cache.json"

    -- Use native Lua file I/O
    local file = io.open(stats_file, "r")
    if not file then
        claude_msgs:set({ label = { string = "no file" } })
        return
    end

    local result = file:read("*all")
    file:close()

    if not result or result == "" then
        claude_msgs:set({ label = { string = "empty" } })
        return
    end

    local ok, stats = pcall(json.decode, result)
    if not ok then
        claude_msgs:set({ label = { string = "parse err" } })
        return
    end
    if not stats then
        return
    end

    local today = get_today()
    local today_msgs = 0
    local today_tokens = 0
    local today_sessions = 0
    local today_tools = 0

    -- Try to find today's data, fall back to most recent day
    if stats.dailyActivity and #stats.dailyActivity > 0 then
        local found_today = false
        for _, day in ipairs(stats.dailyActivity) do
            if day.date == today then
                today_msgs = day.messageCount or 0
                today_sessions = day.sessionCount or 0
                today_tools = day.toolCallCount or 0
                found_today = true
                break
            end
        end
        -- If today not found, use most recent day
        if not found_today then
            local last_day = stats.dailyActivity[#stats.dailyActivity]
            today_msgs = last_day.messageCount or 0
            today_sessions = last_day.sessionCount or 0
            today_tools = last_day.toolCallCount or 0
        end
    end

    if stats.dailyModelTokens and #stats.dailyModelTokens > 0 then
        local found_today = false
        for _, day in ipairs(stats.dailyModelTokens) do
            if day.date == today then
                if day.tokensByModel then
                    for _, tokens in pairs(day.tokensByModel) do
                        today_tokens = today_tokens + tokens
                    end
                end
                found_today = true
                break
            end
        end
        -- If today not found, use most recent day
        if not found_today then
            local last_day = stats.dailyModelTokens[#stats.dailyModelTokens]
            if last_day.tokensByModel then
                for _, tokens in pairs(last_day.tokensByModel) do
                    today_tokens = today_tokens + tokens
                end
            end
        end
    end

    local msg_color = colors.magenta
    local tok_color = colors.blue

    claude_msgs:set({
        label = {
            string = format_number(today_msgs) .. " msgs",
            color = msg_color
        },
        icon = {
            color = msg_color
        }
    })

    claude_tokens:set({
        label = {
            string = format_number(today_tokens) .. " tok",
            color = tok_color
        },
        icon = {
            color = tok_color
        }
    })

    popup_sessions:set({
        label = tostring(today_sessions)
    })
    popup_tools:set({
        label = format_number(today_tools)
    })
    popup_total_msgs:set({
        label = format_number(stats.totalMessages or 0)
    })
    popup_total_sessions:set({
        label = tostring(stats.totalSessions or 0)
    })
end

claude_msgs:subscribe({"routine", "forced", "system_woke"}, update_claude_stats)

local function hide_details()
    claude_bracket:set({
        popup = {
            drawing = false
        }
    })
end

local function toggle_details()
    local should_draw = claude_bracket:query().popup.drawing == "off"
    if should_draw then
        claude_bracket:set({
            popup = {
                drawing = true
            }
        })
        update_claude_stats()
    else
        hide_details()
    end
end

claude_msgs:subscribe("mouse.clicked", toggle_details)
claude_tokens:subscribe("mouse.clicked", toggle_details)
claude:subscribe("mouse.clicked", toggle_details)
claude:subscribe("mouse.exited.global", hide_details)

update_claude_stats()
