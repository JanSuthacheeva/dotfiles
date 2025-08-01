-- ================================================================================================
-- title : Suckless NeoVim Config By Radley E. Sidwell-lewis
-- author: Jan Suthacheeva
-- ================================================================================================

 -- theme & transparency
vim.cmd.colorscheme("accent")
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

-- Basic settings
vim.opt.number = true                              -- Line numbers
vim.opt.relativenumber = true                      -- Relative line numbers
vim.opt.cursorline = true                          -- Highlight current line
vim.opt.wrap = false                               -- Don't wrap lines
vim.opt.scrolloff = 10                             -- Keep 10 lines above/below cursor 
vim.opt.sidescrolloff = 8                          -- Keep 8 columns left/right of cursor

-- Indentation
vim.opt.tabstop = 2                                -- Tab width
vim.opt.shiftwidth = 2                             -- Indent width
vim.opt.softtabstop = 2                            -- Soft tab stop
vim.opt.expandtab = true                           -- Use spaces instead of tabs
vim.opt.smartindent = true                         -- Smart auto-indenting
vim.opt.autoindent = true                          -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true                          -- Case insensitive search
vim.opt.smartcase = true                           -- Case sensitive if uppercase in search
vim.opt.hlsearch = true                            -- Highlight search results 
vim.opt.incsearch = true                           -- Show matches as you type

-- Visual settings
vim.opt.termguicolors = true                       -- Enable 24-bit colors
vim.opt.signcolumn = "yes"                         -- Always show sign column
vim.opt.colorcolumn = "100"                        -- Show column at 100 characters
vim.opt.showmatch = true                           -- Highlight matching brackets
vim.opt.matchtime = 2                              -- How long to show matching bracket
vim.opt.cmdheight = 1                              -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect"  -- Completion options 
vim.opt.showmode = false                           -- Don't show mode in command line 
vim.opt.pumheight = 10                             -- Popup menu height 
vim.opt.pumblend = 10                              -- Popup menu transparency 
vim.opt.winblend = 0                               -- Floating window transparency 
vim.opt.conceallevel = 0                           -- Don't hide markup 
vim.opt.concealcursor = ""                         -- Don't hide cursor line markup 
vim.opt.lazyredraw = true                          -- Don't redraw during macros
vim.opt.synmaxcol = 300                            -- Syntax highlighting limit 

-- File handling
vim.opt.backup = false                             -- Don't create backup files
vim.opt.writebackup = false                        -- Don't create backup before writing
vim.opt.swapfile = false                           -- Don't create swap files
vim.opt.undofile = true                            -- Persistent undo
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")  -- Undo directory
vim.opt.updatetime = 300                           -- Faster completion
vim.opt.timeoutlen = 500                           -- Key timeout duration
vim.opt.ttimeoutlen = 0                            -- Key code timeout
vim.opt.autoread = true                            -- Auto reload files changed outside vim
vim.opt.autowrite = false                          -- Don't auto save

-- Behavior settings
vim.opt.hidden = true                              -- Allow hidden buffers
vim.opt.errorbells = false                         -- No error bells
vim.opt.backspace = "indent,eol,start"             -- Better backspace behavior
vim.opt.autochdir = false                          -- Don't auto change directory
vim.opt.iskeyword:append("-")                      -- Treat dash as part of word
vim.opt.path:append("**")                          -- include subdirectories in search
vim.opt.selection = "exclusive"                    -- Selection behavior
vim.opt.mouse = "a"                                -- Enable mouse support
vim.opt.clipboard:append("unnamedplus")            -- Use system clipboard
vim.opt.modifiable = true                          -- Allow buffer modifications
vim.opt.encoding = "UTF-8"                         -- Set encoding

-- Cursor settings
vim.opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Folding settings
vim.opt.foldmethod = "expr"                             -- Use expression for folding
-- vim.wo.vim.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for folding
vim.opt.foldlevel = 99                                  -- Start with all folds open

-- Split behavior
vim.opt.splitbelow = true                          -- Horizontal splits go below
vim.opt.splitright = true                          -- Vertical splits go right

-- Key mappings
vim.g.mapleader = " "                              -- Set leader key to space
vim.g.maplocalleader = " "                         -- Set local leader key (NEW)

-- Normal mode mappings
vim.keymap.set("n", "<leader>k", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Buffer navigation
vim.keymap.set("n", "]b", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "[b", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Close buffer" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Quick file navigation
vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Find file" })

-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Quick config editing
vim.keymap.set("n", "<leader>rc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Edit config" })

-- ============================================================================
-- USEFUL FUNCTIONS
-- ============================================================================

-- Copy Full File-Path
vim.keymap.set("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end)

-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Set filetype-specific settings
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "lua", "python", "go" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = augroup,
    pattern = { "make", },
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.expandtab = false
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = augroup,
    pattern = {"php"},
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
        vim.opt.expandtab = true
    end
})


vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "javascript", "typescript", "json", "html", "css", "php" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- Auto-close terminal when process exits
vim.api.nvim_create_autocmd("TermClose", {
  group = augroup,
  callback = function()
    if vim.v.event.status == 0 then
      vim.api.nvim_buf_delete(0, {})
    end
  end,
})

-- Disable line numbers in terminal
vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
  end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
  group = augroup,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  callback = function()
    local dir = vim.fn.expand('<afile>:p:h')
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end,
})

-- Command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Better diff options
vim.opt.diffopt:append("linematch:60")

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.config/nvim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

-- ============================================================================
-- FLOATING TERMINAL
-- ============================================================================

-- terminal
local terminal_state = {
  buf = nil,
  win = nil,
  is_open = false
}

local function FloatingTerminal()
  -- If terminal is already open, close it (toggle behavior)
  if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
    vim.api.nvim_win_close(terminal_state.win, false)
    terminal_state.is_open = false
    return
  end

  -- Create buffer if it doesn't exist or is invalid
  if not terminal_state.buf or not vim.api.nvim_buf_is_valid(terminal_state.buf) then
    terminal_state.buf = vim.api.nvim_create_buf(false, true)
    -- Set buffer options for better terminal experience
    vim.api.nvim_buf_set_option(terminal_state.buf, 'bufhidden', 'hide')
  end

  -- Calculate window dimensions
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Create the floating window
  terminal_state.win = vim.api.nvim_open_win(terminal_state.buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  -- Set transparency for the floating window
  vim.api.nvim_win_set_option(terminal_state.win, 'winblend', 0)

  -- Set transparent background for the window
  vim.api.nvim_win_set_option(terminal_state.win, 'winhighlight',
    'Normal:FloatingTermNormal,FloatBorder:FloatingTermBorder')

  -- Define highlight groups for transparency
  vim.api.nvim_set_hl(0, "FloatingTermNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "FloatingTermBorder", { bg = "none", })

  -- Start terminal if not already running
  local has_terminal = false
  local lines = vim.api.nvim_buf_get_lines(terminal_state.buf, 0, -1, false)
  for _, line in ipairs(lines) do
    if line ~= "" then
      has_terminal = true
      break
    end
  end

  if not has_terminal then
    vim.fn.termopen(os.getenv("SHELL"))
  end

  terminal_state.is_open = true
  vim.cmd("startinsert")

  -- Set up auto-close on buffer leave 
  vim.api.nvim_create_autocmd("BufLeave", {
    buffer = terminal_state.buf,
    callback = function()
      if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
        vim.api.nvim_win_close(terminal_state.win, false)
        terminal_state.is_open = false
      end
    end,
    once = true
  })
end

-- Function to explicitly close the terminal
local function CloseFloatingTerminal()
  if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
    vim.api.nvim_win_close(terminal_state.win, false)
    terminal_state.is_open = false
  end
end

-- Key mappings
vim.keymap.set("n", "<leader>t", FloatingTerminal, { noremap = true, silent = true, desc = "Toggle floating terminal" })
vim.keymap.set("t", "<Esc>", function()
  if terminal_state.is_open then
    vim.api.nvim_win_close(terminal_state.win, false)
    terminal_state.is_open = false
  end
end, { noremap = true, silent = true, desc = "Close floating terminal from terminal mode" })


-- ============================================================================
-- TABS
-- ============================================================================

-- Tab display settings
vim.opt.showtabline = 1  -- Always show tabline (0=never, 1=when multiple tabs, 2=always)
vim.opt.tabline = ''     -- Use default tabline (empty string uses built-in)

-- Transparent tabline appearance
vim.cmd([[
  hi TabLineFill guibg=NONE ctermfg=242 ctermbg=NONE
]])

-- Alternative navigation (more intuitive)
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', { desc = 'Close tab' })

-- Tab moving
vim.keymap.set('n', '<leader>tm', ':tabmove<CR>', { desc = 'Move tab' })
vim.keymap.set('n', '<leader>t>', ':tabmove +1<CR>', { desc = 'Move tab right' })
vim.keymap.set('n', '<leader>t<', ':tabmove -1<CR>', { desc = 'Move tab left' })

-- Function to open file in new tab
local function open_file_in_tab()
  vim.ui.input({ prompt = 'File to open in new tab: ', completion = 'file' }, function(input)
    if input and input ~= '' then
      vim.cmd('tabnew ' .. input)
    end
  end)
end

-- Function to duplicate current tab
local function duplicate_tab()
  local current_file = vim.fn.expand('%:p')
  if current_file ~= '' then
    vim.cmd('tabnew ' .. current_file)
  else
    vim.cmd('tabnew')
  end
end

-- Function to close tabs to the right
local function close_tabs_right()
  local current_tab = vim.fn.tabpagenr()
  local last_tab = vim.fn.tabpagenr('$')

  for i = last_tab, current_tab + 1, -1 do
    vim.cmd(i .. 'tabclose')
  end
end

-- Function to close tabs to the left
local function close_tabs_left()
  local current_tab = vim.fn.tabpagenr()

  for i = current_tab - 1, 1, -1 do
    vim.cmd('1tabclose')
  end
end

-- Enhanced keybindings
vim.keymap.set('n', '<leader>tO', open_file_in_tab, { desc = 'Open file in new tab' })
vim.keymap.set('n', '<leader>td', duplicate_tab, { desc = 'Duplicate current tab' })
vim.keymap.set('n', '<leader>tr', close_tabs_right, { desc = 'Close tabs to the right' })
vim.keymap.set('n', '<leader>tL', close_tabs_left, { desc = 'Close tabs to the left' })

-- Function to close buffer but keep tab if it's the only buffer in tab
local function smart_close_buffer()
  local buffers_in_tab = #vim.fn.tabpagebuflist()
  if buffers_in_tab > 1 then
    vim.cmd('bdelete')
  else
    -- If it's the only buffer in tab, close the tab
    vim.cmd('tabclose')
  end
end
vim.keymap.set('n', '<leader>bd', smart_close_buffer, { desc = 'Smart close buffer/tab' })

local function colors(color)
    if color == 'yellow' then
      vim.cmd[[
      let g:accent_colour = 'yellow'
      colorscheme accent
      ]]
    elseif color == 'orange' then
      vim.cmd[[
      let g:accent_colour = 'orange'
      colorscheme accent
      ]]
    elseif color == 'red' then
      vim.cmd[[
      let g:accent_colour = 'red'
      colorscheme accent
      ]]
    elseif color == 'green' then
      vim.cmd[[
      let g:accent_colour = 'green'
      colorscheme accent
      ]]
    elseif color == 'blue' then
      vim.cmd[[
      let g:accent_colour = 'blue'
      colorscheme accent
      ]]
    elseif color == 'magenta' then
      vim.cmd[[
      let g:accent_colour = 'magenta'
      colorscheme accent
      ]]
    elseif color == 'cyan' then
      vim.cmd[[
      let g:accent_colour = 'cyan'
      colorscheme accent
      ]]
    else
      vim.cmd[[
      let g:accent_colour = 'green'
      colorscheme accent
      ]]
    end
end

local callback = function(opts) local color = opts.args
    colors(color)
end

vim.api.nvim_create_user_command('Colors', callback, {
  nargs = 1,
})

-- ============================================================================
-- STATUSLINE
-- ============================================================================

-- Git branch function
local function git_branch()
  local branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
  if branch ~= "" then
    return "  " .. branch .. " "
  end
  return ""
end

-- File type with icon
local function file_type()
  local ft = vim.bo.filetype
  local icons = {
    lua = "[LUA]",
    python = "[PY]",
    javascript = "[JS]",
    html = "[HTML]",
    css = "[CSS]",
    json = "[JSON]",
    markdown = "[MD]",
    vim = "[VIM]",
    sh = "[SH]",
    php = "[PHP]",
  }

  if ft == "" then
    return "  "
  end

  return (icons[ft] or ft)
end

-- LSP status
local function lsp_status()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients > 0 then
    return "  LSP "
  end
  return ""
end

-- Word count for text files
local function word_count()
  local ft = vim.bo.filetype
  if ft == "markdown" or ft == "text" or ft == "tex" then
    local words = vim.fn.wordcount().words
    return "  " .. words .. " words "
  end
  return ""
end

-- File size
local function file_size()
  local size = vim.fn.getfsize(vim.fn.expand('%'))
  if size < 0 then return "" end
  if size < 1024 then
    return size .. "B "
  elseif size < 1024 * 1024 then
    return string.format("%.1fK", size / 1024)
  else
    return string.format("%.1fM", size / 1024 / 1024)
  end
end

-- Mode indicators with icons
local function mode_icon()
  local mode = vim.fn.mode()
  local modes = {
    n = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    V = "V-LINE",
    ["\22"] = "V-BLOCK",  -- Ctrl-V
    c = "COMMAND",
    s = "SELECT",
    S = "S-LINE",
    ["\19"] = "S-BLOCK",  -- Ctrl-S
    R = "REPLACE",
    r = "REPLACE",
    ["!"] = "SHELL",
    t = "TERMINAL"
  }
  return modes[mode] or "  " .. mode:upper()
end

_G.mode_icon = mode_icon
_G.git_branch = git_branch
_G.file_type = file_type
_G.file_size = file_size
_G.lsp_status = lsp_status

vim.cmd([[
  highlight StatusLineBold gui=bold cterm=bold
]])

-- Function to change statusline based on window focus
local function setup_dynamic_statusline()
  vim.api.nvim_create_autocmd({"WinEnter", "BufEnter"}, {
    callback = function()
    vim.opt_local.statusline = table.concat {
      "  ",
      "%#StatusLineBold#",
      "%{v:lua.mode_icon()}",
      "%#StatusLine#",
      " │ %f %h%m%r",
      "%{v:lua.git_branch()}",
      " │ ",
      "%{v:lua.file_type()}",
      " | ",
      "%{v:lua.file_size()}",
      " | ",
      "%{v:lua.lsp_status()}",
      "%=",                     -- Right-align everything after this
      "%l:%c  %P ",             -- Line:Column and Percentage
    }
    end
  })
  vim.api.nvim_set_hl(0, "StatusLineBold", { bold = true })

  vim.api.nvim_create_autocmd({"WinLeave", "BufLeave"}, {
    callback = function()
      vim.opt_local.statusline = "  %f %h%m%r │ %{v:lua.file_type()} | %=  %l:%c   %P "
    end
  })
end

setup_dynamic_statusline()

-- ============================================================================
-- LSP 
-- ============================================================================

-- -- Function to find project root
-- local function find_root(patterns)
--   local path = vim.fn.expand('%:p:h')
--   local root = vim.fs.find(patterns, { path = path, upward = true })[1]
--   return root and vim.fn.fnamemodify(root, ':h') or path
-- end
--
-- -- Shell LSP setup
-- local function setup_shell_lsp()
--   vim.lsp.start({
--     name = 'bashls',
--     cmd = {'bash-language-server', 'start'},
--     filetypes = {'sh', 'bash', 'zsh'},
--     root_dir = find_root({'.git', 'Makefile'}),
--     settings = {
--       bashIde = {
--         globPattern = "*@(.sh|.inc|.bash|.command)"
--       }
--     }
--   })
-- end
--
-- -- Lua LSP setup
-- local function setup_lua_lsp()
--     vim.lsp.start({
--         name = "lua_ls",
--         cmd = {"/opt/homebrew/bin/lua-language-server"},
--         filetypes = {"lua"},
--         root_dir = find_root({"init.lua", }),
--         settings = {
--         },
--     })
-- end
--
-- -- PHP LSP setup
-- local function setup_php_lsp()
--     vim.lsp.start({
--         name = 'intelephense',
--         cmd = { 'intelephense', '--stdio' },
--         filetypes = {'php'},
--         root_dir = find_root({'composer-lock.json', 'composer.json', '.git'}),
--         settings = {
--         },
--     })
-- end
--
-- local function set_python_path(path)
--   local clients = vim.lsp.get_clients {
--     bufnr = vim.api.nvim_get_current_buf(),
--     name = 'pyright',
--   }
--   for _, client in ipairs(clients) do
--     if client.settings then
--       client.settings.python = vim.tbl_deep_extend('force', client.settings.python, { pythonPath = path })
--     else
--       client.config.settings = vim.tbl_deep_extend('force', client.config.settings, { python = { pythonPath = path } })
--     end
--     client.notify('workspace/didChangeConfiguration', { settings = nil })
--   end
-- end
--
-- -- Python LSP setup
-- local function setup_python_lsp()
--   vim.lsp.start({
--     name = 'pyright',
--     cmd = { 'pyright-langserver', '--stdio' },
--     filetypes = { 'python' },
--     root_dir = find_root({ 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', 'pyrightconfig.json', '.git' }),
--     settings = {
--       python = {
--         analysis = {
--           autoSearchPaths = true,
--           useLibraryCodeForTypes = true,
--           diagnosticMode = 'openFilesOnly',
--         },
--       },
--     },
--     on_attach = function(client, bufnr)
--       vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightOrganizeImports', function()
--         client:exec_cmd({
--           command = 'pyright.organizeimports',
--           arguments = { vim.uri_from_bufnr(bufnr) },
--         })
--       end, {
--         desc = 'Organize Imports',
--       })
--       vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightSetPythonPath', set_python_path, {
--         desc = 'Reconfigure pyright with the provided python path',
--         nargs = 1,
--         complete = 'file',
--       })
--     end,
--   })
-- end
--
-- -- Tailwind LSP setup
-- local function setup_tailwind_lsp()
--     vim.lsp.start({
--         name = 'tailwindcss-language-server',
--         cmd = {'tailwindcss-language-server', '--stdio'},
--         filetypes = {'html', 'blade', 'php', 'javascript'},
--         root_dir = find_root({'.git'}),
--         settings = {
--         }
--     })
-- end
--
-- -- HTML LSP setup
-- local function setup_html_lsp()
--     vim.lsp.start({
--         name = 'html',
--         cmd = { 'vscode-html-language-server', '--stdio' },
--         filetypes = { 'html', 'javascript', 'blade', 'php' },
--         root_dir = find_root({'git'}),
--         settings = {
--         }
--     })
--     vim.lsp.start({
--         name = 'stimulus',
--         cmd = { 'stimulus-language-server', '--stdio' },
--         filetypes = { 'html', 'ruby', 'eruby', 'blade', 'php' },
--         root_dir = find_root({ 'Gemfile', '.git' }),
--         settings = {
--         },
--     })
-- end
--
-- -- Laravel LSP setup
-- local function setup_laravel_lsp()
--     vim.lsp.start({
--         name = 'laravel',
--         cmd = { 'laravel-ls' },
--         filetypes = { 'php', 'blade' },
--         root_dir = find_root({'artisan'}),
--         settings = {
--         }
--     })
-- end
--
--
-- -- Auto-start LSPs based on filetype
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'sh,bash,zsh',
--   callback = setup_shell_lsp,
--   desc = 'Start shell LSP'
-- })
--
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'php,blade',
--   callback = setup_laravel_lsp,
--   desc = 'Start Laravel LSP'
-- })
--
-- vim.api.nvim_create_autocmd('FileType', {
--     pattern = 'html,css,blade',
--     callback = setup_tailwind_lsp,
--     desc = 'Start Tailwind LSP'
-- })
--
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'python',
--   callback = setup_python_lsp,
--   desc = 'Start Python LSP'
-- })
--
-- vim.api.nvim_create_autocmd('FileType', {
--     pattern = 'lua',
--     callback = setup_lua_lsp,
--     desc = 'Start lua LSP'
-- })
--
-- vim.api.nvim_create_autocmd('FileType', {
--     pattern = 'php',
--     callback = setup_php_lsp,
--     desc = 'Start PHP LSP'
-- })
--
-- vim.api.nvim_create_autocmd('FileType', {
--     pattern = 'html,blade,php',
--     callback = setup_html_lsp,
--     desc = 'Start HTML LSP'
-- })
--
-- -- LSP keymaps 
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(event)
--     local opts = {buffer = event.buf}
--
--     -- Navigation
--     vim.keymap.set('n', 'gD', vim.lsp.buf.definition, opts)
--     vim.keymap.set('n', 'gs', vim.lsp.buf.declaration, opts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--
--     -- Information
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--
--     -- Code actions
--     vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
--     vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
--
--     -- Diagnostics
--     vim.keymap.set('n', '<leader>nd', vim.diagnostic.goto_next, opts)
--     vim.keymap.set('n', '<leader>pd', vim.diagnostic.goto_prev, opts)
--     vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
--     vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
--   end,
-- })
--
-- -- Better LSP UI
-- vim.diagnostic.config({
--   virtual_text = { prefix = '●' },
--   signs = true,
--   underline = true,
--   update_in_insert = false,
--   severity_sort = true,
-- })
--
-- vim.diagnostic.config({
--   signs = {
--     text = {
--       [vim.diagnostic.severity.ERROR] = "✗",
--       [vim.diagnostic.severity.WARN] = "⚠",
--       [vim.diagnostic.severity.INFO] = "ℹ",
--       [vim.diagnostic.severity.HINT] = "💡",
--     }
--   }
-- })
--
-- vim.api.nvim_create_user_command('LspInfo', function()
--   local clients = vim.lsp.get_clients({ bufnr = 0 })
--   if #clients == 0 then
--     print("No LSP clients attached to current buffer")
--   else
--     for _, client in ipairs(clients) do
--       print("LSP: " .. client.name .. " (ID: " .. client.id .. ")")
--     end
--   end
-- end, { desc = 'Show LSP client info' })


vim.g.python3_host_prog = "/Library/Frameworks/Python.framework/Versions/3.13/bin/python3"
vim.g.python_host_prog = "/Library/Frameworks/Python.framework/Versions/3.13/bin/python3"


require('config.lazy')
