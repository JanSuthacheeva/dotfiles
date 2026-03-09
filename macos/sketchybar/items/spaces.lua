local colors = require("colors")

local workspaces = get_workspaces()
local current_workspace = get_current_workspace()

local function split(str, sep)
    local result = {}
    local regex = ("([^%s]+)"):format(sep)
    for each in str:gmatch(regex) do
        table.insert(result, each)
    end
    return result
end

for i, workspace in ipairs(workspaces) do
    local selected = workspace == current_workspace
    local space = sbar.add("item", "item." .. i, {
        position = "left",
        icon = {
            string = "●",
            font = { size = selected and 22.0 or 16.0 },
            padding_left = 2,
            padding_right = 2,
            color = selected and colors.yellow or colors.grey,
            y_offset = 0,
        },
        label = {
            drawing = false,
        },
        width = selected and 20 or 16,
        align = "center",
        padding_right = 0,
        padding_left = 0,
        background = {
            drawing = false,
        },
        popup = {
            background = {
                border_width = 5,
                border_color = colors.black
            }
        }
    })

    -- Set color based on whether workspace has windows
    if not selected then
        sbar.exec("aerospace list-windows --workspace " .. i .. " --format '%{app-name}' --json", function(apps)
            space:set({ icon = { color = (#apps > 0) and colors.grey or colors.black } })
        end)
    end

    -- Item popup
    local space_popup = sbar.add("item", {
        position = "popup." .. space.name,
        padding_left = 5,
        padding_right = 0,
        background = {
            drawing = true,
            image = {
                corner_radius = 9,
                scale = 0.2
            }
        }
    })

    space:subscribe("aerospace_workspace_change", function(env)
        local sel = env.FOCUSED_WORKSPACE == workspace
        if sel then
            sbar.animate("circ", 20, function()
                space:set({
                    icon = { font = { size = 22.0 }, color = colors.yellow },
                    width = 20,
                })
            end)
        else
            sbar.exec("aerospace list-windows --workspace " .. i .. " --format '%{app-name}' --json", function(apps)
                sbar.animate("circ", 20, function()
                    space:set({
                        icon = { font = { size = 16.0 }, color = (#apps > 0) and colors.grey or colors.black },
                        width = 16,
                    })
                end)
            end)
        end
    end)

    space:subscribe("mouse.clicked", function(env)
        local SID = split(env.NAME, ".")[2]
        if env.BUTTON == "other" then
            space_popup:set({
                background = {
                    image = "item." .. SID
                }
            })
            space:set({
                popup = {
                    drawing = "toggle"
                }
            })
        else
            sbar.exec("aerospace workspace " .. SID)
        end
    end)

    space:subscribe("mouse.exited", function(_)
        space:set({
            popup = {
                drawing = false
            }
        })
    end)
end
