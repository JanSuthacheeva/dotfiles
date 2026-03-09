local settings = require("settings")

-- Right side: first loaded = rightmost
require("items.widgets.input_source")
require("items.widgets.wifi")
require("items.widgets.volume")
require("items.widgets.battery")

sbar.add("item", "widgets.outer.padding", {
    position = "right",
    width = settings.group_paddings
})
