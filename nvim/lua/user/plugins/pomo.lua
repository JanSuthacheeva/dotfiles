return {
  {
    "rcarriga/nvim-notify",
    config = function()
     require("notify").setup({
        top_down = false, -- Set to false for bottom-right notifications
      })
      vim.notify = require("notify") -- Ensure notify is used globally
    end,
    opts = {
    }
  },
  {
    "epwalsh/pomo.nvim",
    version = "*",
    lazy = true,
    cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
    dependencies = { "rcarriga/nvim-notify" },
    opts = {
    },
  }
}
