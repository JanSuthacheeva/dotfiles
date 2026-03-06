local colors = require("colors")

require("items.aerospace")
require("items.apple")
require("items.menus")
require("items.spaces")
-- require("items.front_app")
require("items.calendar")
require("items.widgets")
require("items.media")

-- Island brackets
local island_bg = {
    color = colors.bg1,
    corner_radius = 12,
    height = 28,
}

-- Left island: spaces (disabled for now)
-- sbar.add("bracket", { "/item\\..*/" }, {
--     background = island_bg,
-- })

-- Right island: widgets + calendar (disabled for now)
-- sbar.add("bracket", { "widgets.battery", "widgets.volume1", "widgets.volume2",
--                        "widgets.wifi1", "widgets.wifi2", "widgets.cpu" }, {
--     background = island_bg
-- })