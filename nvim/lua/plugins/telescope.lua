return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<cr>', { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>g', '<cmd>Telescope live_grep<cr>', { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<cr>', { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Telescope help tags' })
    end
    }

