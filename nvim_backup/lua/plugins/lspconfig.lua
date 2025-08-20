return {
    {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'b0o/schemastore.nvim',
        -- { 'nvimtools/none-ls.nvim', dependencies = 'nvim-lua/plenary.nvim' },
        -- 'jayp0521/mason-null-ls.nvim',
    },
    config = function() 
        local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

        -- PHP

        require('lspconfig').intelephense.setup({
          commands = {
            IntelephenseIndex = {
              function()
                vim.lsp.buf.execute_command({ command = 'intelephense.index.workspace' })
              end,
            },
          },
          -- on_attach = function(client)
            -- client.server_capabilities.documentFormattingProvider = false
            -- client.server_capabilities.documentRangeFormattingProvider = false
            -- if client.server_capabilities.inlayHintProvider then
            --   vim.lsp.buf.inlay_hint(bufnr, true)
            -- end
          -- end,
          capabilities = capabilities
        })

        -- Python
        require'lspconfig'.pyright.setup({
            capabilities = capabilities
        })

         -- Tailwind CSS
        -- require('lspconfig').tailwindcss.setup({ capabilities = capabilities })

        -- -- JSON
        -- require('lspconfig').jsonls.setup({
        --   capabilities = capabitslslities,
        --   settings = {
        --     json = {
        --       -- schemas = require('schemastore').json.schemas(),
        --     },
        --   },
        -- })

        -- Lua
        require('lspconfig').lua_ls.setup({
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT' },
              workspace = {
                checkThirdParty = false,
                library = {
                  '${3rd}/luv/library',
                  unpack(vim.api.nvim_get_runtime_file('', true)),
                },
              }
            }
          },
          capabilities = capabilities
        })
        -- Stimulus for Blade and PHP
        -- require('lspconfig').stimulus_ls.setup({
        -- capabilities = capabilities,
        -- filetypes = { "html", "ruby", "eruby", "blade"},
        -- })

        require('lspconfig').gopls.setup({})

        -- HTML
        require('lspconfig').html.setup({
          capabilities = capabilities,
          })
        -- Keymaps
        vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
        vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>')
        vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
        vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
        vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
        vim.keymap.set('n', '<Leader>lr', ':LspRestart<CR>', { silent = true })
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
        vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

        -- Commands
        vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format({ timeout_ms = 5000 }) end, {})

        -- Diagnostic configuration
        vim.diagnostic.config({
          virtual_text = false,
          float = {
            source = true,
          }
        })

        -- Sign configuration
        vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
        vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
        vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
        vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
    end,
    },
    {
        'jwalton512/vim-blade'
    }
}
