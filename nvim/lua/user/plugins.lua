local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').reset()
require('packer').init({
  compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'solid' })
    end,
  },
})

local use = require('packer').use
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#000000' })
-- Theme
use({'catppuccin/nvim',
  as = "catppuccin",
  config = function()
    vim.cmd('colorscheme catppuccin-frappe')
    require("catppuccin").setup({
      integrations = {
        nvimtree = true
      }
    })
  end,
})

-- Packer can manage itself.
use('wbthomason/packer.nvim')

-- Commenting support.
use('tpope/vim-commentary')

-- Add, change, and delete surrounding text.
use('tpope/vim-surround')

-- Useful commands like :Rename and :SudoWrite.
use('tpope/vim-eunuch')

-- Pairs of handy bracket mappings, like [b and ]b.
use('tpope/vim-unimpaired')

-- Indent autodetection with editorconfig support.
use('tpope/vim-sleuth')

-- Allow plugins to enable repeating of commands.
use('tpope/vim-repeat')

-- Add more languages.
-- use('sheerun/vim-polyglot')

-- Navigate seamlessly between Vim windows and Tmux panes.
use('christoomey/vim-tmux-navigator')

-- Jump to the last location when opening a file.
use('farmergreg/vim-lastplace')

-- Enable * searching with visually selected text.
use('nelstrom/vim-visual-star-search')

-- Automatically create parent dirs when saving.
use('jessarcher/vim-heritage')

-- Text objects for HTML attributes.
use({
  'whatyouhide/vim-textobj-xmlattr',
  requires = 'kana/vim-textobj-user',
})

-- Automatically set the working directory to the project root.
use({
  'airblade/vim-rooter',
  setup = function()
    -- Instead of this running every time we open a file, we'll just run it once when Vim starts.
    vim.g.rooter_manual_only = 1
  end,
  config = function()
    vim.cmd('Rooter')
  end,
})

-- Automatically add closing brackets, quotes, etc.
use({
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup()
  end,
})

-- Add smooth scrolling to avoid jarring jumps
use({
  'karb94/neoscroll.nvim',
  config = function()
    require('neoscroll').setup()
  end,
})

-- All closing buffers without closing the split window.
use({
  'famiu/bufdelete.nvim',
  config = function()
    vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
  end,
})

-- Split arrays and methods onto multiple lines, or join them back up.
use({
  'AndrewRadev/splitjoin.vim',
  config = function()
    vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
    vim.g.splitjoin_trailing_comma = 1
    vim.g.splitjoin_php_method_chain_full = 1
  end,
})

-- Automatically fix indentation when pasting code.
use({
  'sickill/vim-pasta',
  config = function()
    vim.g.pasta_disabled_filetypes = { 'fugitive' }
  end,
})

-- Markdown preview
-- install without yarn or npm
use({
  "iamcco/markdown-preview.nvim",
  run = function()
    vim.fn["mkdp#util#install"]()
  end,
  setup = function()
    local g = vim.g
    g.mkdp_page_title = "${name}.md"
    g.mkdp_theme = 'light'
    g.mkdp_auto_close = 0
  end,
  ft = "markdown",
})


-- Telescope
use({
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'nvim-telescope/telescope-live-grep-args.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
  },
  config = function()
    require('user/plugins/telescope')
  end
})

-- File tree sidebar
use({
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('user/plugins/nvim-tree')
  end,
})
vim.g.skip_ts_context_commentstring_module = true
-- A Status line.
use({
  'nvim-lualine/lualine.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('lualine').setup()
  end,
})


require('nvim-tree').setup({
  git = {
    ignore = false,
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        folder_arrow = false,
      },
    },
    indent_markers = {
      enable = true,
    },
  },
})

vim.keymap.set('n', '<Leader>n', ':NvimTreeFindFileToggle<CR>')

-- Display buffers as tabs.
use({
  'akinsho/bufferline.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  after = 'catppuccin',
  config = function()
    require("user/plugins/bufferline")
  end
})

-- Display indentation lines.
use({
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require("ibl").setup({
      exclude = {
       filetypes = {
        'dashboard',
      }
    ,}})
  end,
})

-- Add a dashboard.
use({
  'glepnir/dashboard-nvim',
  config = function()
    require('user/plugins/dashboard-nvim')
  end
})
-- use {
--   'nvimdev/dashboard-nvim',
--   event = 'VimEnter',
--   config = function()
--     require('user/plugins/dashboard-nvim')
--   end,
--   requires = {'nvim-tree/nvim-web-devicons'}
-- }
-- Git integration.
use({
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
    vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
    vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
    vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
    vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
    vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
    vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
  end,
})

-- Git commands.
use({
  'tpope/vim-fugitive',
  requires = 'tpope/vim-rhubarb',
})

--- Floating terminal.
use({
  'voldikss/vim-floaterm',
  config = function()
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
    vim.g.floaterm_borderchars = '        '
    vim.keymap.set('n', '<Leader>tt', ':FloatermToggle<CR>')
    vim.keymap.set('t', '<Leader>tt', '<C-\\><C-n>:FloatermToggle<CR>')
  end
})
-- Improved syntax highlighting
use({
  'nvim-treesitter/nvim-treesitter',
  run = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  requires = {
    'JoosepAlviste/nvim-ts-context-commentstring' ,
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    require('user/plugins/treesitter')
  end,
})
-- Language Server Protocol.
use({
  'neovim/nvim-lspconfig',
  requires = {
    {'williamboman/mason.nvim', build = ":MasonUpdate"},
  'williamboman/mason-lspconfig.nvim',
   'b0o/schemastore.nvim',
   'jose-elias-alvarez/null-ls.nvim',
    'jayp0521/mason-null-ls.nvim',
  },
  config = function()
    require('user/plugins/lspconfig')
  end,
})

-- Go Debugging
use('mfussenegger/nvim-dap')

use ({
  'leoluz/nvim-dap-go',
  ft = "go",
  dependencies = "mfussenegger/nvim-dap",
  config = function(_, opts)
    require("dap-go").setup(opts)
    require("core.utils").load_mappings("dap_go")
  end
})

-- Completion
use({
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
  },
  config = function()
    require('user/plugins/cmp')
  end,
})

-- PHP Refactoring Tools
use({
  'phpactor/phpactor',
  ft = 'php',
  run = 'composer install --no-dev --optimize-autoloader',
  config = function()
    vim.keymap.set('n', '<Leader>pm', ':PhpactorContextMenu<CR>')
    vim.keymap.set('n', '<Leader>pn', ':PhpactorClassNew<CR>')
  end,
})

-- Project Configuration.
use({
  'tpope/vim-projectionist',
  requires = 'tpope/vim-dispatch',
  config = function()
    require('user/plugins/projectionist')
  end,
})
-- Testing helper
use({
  'vim-test/vim-test',
  config = function()
    require('user/plugins/vim-test')
  end,
})

use ({
  'prettier/vim-prettier',
  run = 'yarn install --frozen-lockfile --production',
  ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'}
})

use({
    'MeanderingProgrammer/markdown.nvim',
    as = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    after = { 'nvim-treesitter' },
    config = function()
        require('render-markdown').setup({})
    end,
})

use('github/copilot.vim')

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
    require('packer').sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])
