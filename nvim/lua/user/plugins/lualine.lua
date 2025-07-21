-- Status line

return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  dependencies = {
    'arkav/lualine-lsp-progress',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    options = {
      section_separators = '',
      component_separators = '',
      globalstatus = true,
      theme = {
        normal = {
          a = 'StatusLine',
          b = 'StatusLine',
          c = 'StatusLine',
        },
      },
    },
    sections = {
      lualine_a = {
        'mode',
      },
      lualine_b = {
        'branch',
        {
          'diff',
          symbols = { added = ' ', modified = ' ', removed = ' ' },
        },
        function ()
          return '󰅭 ' .. vim.pesc(tostring(#vim.tbl_keys(vim.lsp.buf_get_clients())) or '')
        end,
        { 'diagnostics', sources = { 'nvim_diagnostic' } },
      },
      lualine_c = {
        {
          'buffers',
          show_filename_only = true,
          show_modified_status = true,
          mode = 0,
          buffers_color = {
            active = {
                fg = '#000000',
                bg = '#ffffff',
                bold = true
            },
          },
          separator = { left = '|', right = '|' },
        }

      },
      lualine_x = {
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = { fg = "#ff9e64" },
        },
      },
      lualine_y = {
        'filetype',
        'encoding',
        'fileformat',
        '(vim.bo.expandtab and "␠ " or "⇥ ") .. vim.bo.shiftwidth',
      },
      lualine_z = {
        'searchcount',
        'selectioncount',
        'location',
        'progress',
        },
    },
  },
}
