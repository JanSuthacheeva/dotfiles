-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "user/plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = {"tokyonight-storm", "habamax", "256_noir" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#7AA2F8' })
vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FD9D63'})

-- local dap = require('dap')

-- dap.adapters.php = {
--   type = "executable",
--   command = "node",
--   args = { os.getenv("HOME") .. "/projects/php/vscode-php-debug/out/phpDebug.js" }
-- }

-- dap.configurations.php = {
--   {
--       type = "php",
--       request = "launch",
--       name = "Listen for Xdebug",
--       port = 9003
--   }
-- }
