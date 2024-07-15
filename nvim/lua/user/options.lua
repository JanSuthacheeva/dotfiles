vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.g.skip_ts_context_commentstring_module = true
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#000000' })

vim.opt.smartindent = true

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
