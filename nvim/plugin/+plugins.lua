vim.pack.add({
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/AlexvZyl/nordic.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/vim-test/vim-test" },
  { src = "https://github.com/nvim-lualine/lualine.nvim"},
})

require "mason".setup()
require "mini.pick".setup()
require "nvim-treesitter".setup({
  ensure_installed = {"blade", "css", "go", "gomod", "html", "lua", "php", "python", "swift", "sql"},
  auto_install = true,
    highlight = {
      enable = true,
  },

  config = function()
      local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = {"src/parser.c"},
          branch = "main",
        },
        filetype = "blade"
      }
      vim.filetype.add({
        pattern = {
          ['.*%.blade%.php'] = 'blade',
        },
      })
    end
})
require "nvim-treesitter.configs".setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
        enable = true,
  },
})

-- local custom_onelight = require'lualine.themes.onelight'

-- Change the background of lualine_c section for normal mode
-- custom_onelight.normal.a.bg = '#000000'
-- custom_onelight.insert.a.bg = '#000000'

require('lualine').setup {
  -- options = { theme  = custom_onelight },
  ...
}




-- vim test config
vim.cmd([[

  function! Get_OSC52(cmd)
    let b64 = s:b64encode(a:cmd, 0)
    let rv = "\e]52;c;" . b64 . "\x07"
    call chansend(v:stderr, rv)
    stop
  endfun

  " Lookup table for s:b64encode.
  let s:b64_table = [
        \ "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P",
        \ "Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f",
        \ "g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v",
        \ "w","x","y","z","0","1","2","3","4","5","6","7","8","9","+","/"]
  
  " Encodes a string of bytes in base 64.
  "
  " Based on http://vim-soko.googlecode.com/svn-history/r405/trunk/vimfiles/
  " autoload/base64.vim
  "
  " If size is > 0 the output will be line wrapped every `size` chars.
  function! s:b64encode(str, size)
    let bytes = s:str2bytes(a:str)
    let b64 = []
  
    for i in range(0, len(bytes) - 1, 3)
      let n = bytes[i] * 0x10000
            \ + get(bytes, i + 1, 0) * 0x100
            \ + get(bytes, i + 2, 0)
      call add(b64, s:b64_table[n / 0x40000])
      call add(b64, s:b64_table[n / 0x1000 % 0x40])
      call add(b64, s:b64_table[n / 0x40 % 0x40])
      call add(b64, s:b64_table[n % 0x40])
    endfor
  
    if len(bytes) % 3 == 1
      let b64[-1] = '='
      let b64[-2] = '='
    endif
  
    if len(bytes) % 3 == 2
      let b64[-1] = '='
    endif
  
    let b64 = join(b64, '')
    if a:size <= 0
      return b64
    endif
  
    let chunked = ''
    while strlen(b64) > 0
      let chunked .= strpart(b64, 0, a:size) . "\n"
      let b64 = strpart(b64, a:size)
    endwhile
    return chunked
  endfun
  
  " String to bytes
  function! s:str2bytes(str)
    return map(range(len(a:str)), 'char2nr(a:str[v:val])')
  endfun

  let test#custom_strategies = {'ghostty': function('Get_OSC52')}

  let test#php#pest#executable = 'php artisan test'
  let test#php#pest#options = '--colors=always'
  let test#php#pest#options = '-v'
  let test#strategy = 'terminal'
]])

vim.cmd [[colorscheme nordic]]
