vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Override settings for Python files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.textwidth = 79
  end,
})

vim.g.skip_ts_context_commentstring_module = true
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#000000' })
vim.api.nvim_set_hl(0, 'Comment', { italic=true })
vim.opt.smartindent = true
-- Set custom colors for the currently opened buffer
vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { fg = "#FFA500", bold = true })

vim.opt.wrap = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wildmode = 'longest:full,full' -- complete the longest common match,, and allow tabbing the results to fully complete them

vim.opt.title = true
vim.opt.mouse = 'a' -- enable mouse for all modes

vim.opt.termguicolors = true
vim.opt.spell = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.list = true -- enable the below listchars
vim.opt.listchars = { tab = '· ', trail = '.' }
vim.opt.fillchars:append({ eob = ' ' }) -- remove the ~ from end of buffer

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

vim.opt.clipboard = 'unnamedplus' -- Use system clipboard

vim.opt.completeopt = 'menuone,longest,preview'
vim.opt.signcolumn = 'yes:2'

vim.opt.confirm = true -- ask for confirmation instead of erroring

vim.opt.undofile = true -- persistent undo
vim.opt.backup = true -- automatically save a backup file
vim.opt.backupdir:remove('.') -- keep backup out of the current directory

local function replace_journal_placeholders()
  local date = os.date("%d.%B %Y")
  local day = os.date("%A")
  local timestamp = Get_iso8601_timestamp()
  vim.api.nvim_command('%s/{{DATE_PLACEHOLDER}}/' .. date .. '/g')
  vim.api.nvim_command('%s/{{DAY_PLACEHOLDER}}/' .. day .. '/g')
  vim.api.nvim_command('%s/{{TIMESTAMP_PLACEHOLDER}}/' .. timestamp .. '/g')
end

function Get_iso8601_timestamp()
  local date_time = os.date("%Y-%m-%dT%H:%M:%S") -- Local time
  local local_offset_sec = os.difftime(os.time(), os.time(os.date("!*t")))
  local offset_hours = math.floor(local_offset_sec / 3600)
  local offset_minutes = math.abs(local_offset_sec % 3600 / 60)
  local offset_sign = offset_hours >= 0 and "+" or "-"
  local offset_formatted = string.format("%s%02d%02d", offset_sign, math.abs(offset_hours), offset_minutes)
  return date_time .. offset_formatted
end

vim.api.nvim_create_user_command("JournalReplace", replace_journal_placeholders, {})

vim.api.nvim_create_user_command("JournalToday", function()
    vim.cmd("Neorg journal today")
    vim.cmd("JournalReplace")
end, {})
