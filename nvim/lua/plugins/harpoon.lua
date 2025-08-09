return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        -- REQUIRED
        harpoon:setup()
        -- REQUIRED
        -- Add file
        vim.keymap.set("n", "<leader>hn", function()
        harpoon:list():add()
        end)
        vim.keymap.set("n", "<leader>hd", function()
        harpoon:list():clear()
        end)
        -- Toggle quick menu
        vim.keymap.set("n", "<leader>hh", function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end)
        -- Navigate to specific files
        vim.keymap.set("n", "<leader>hq", function()
          harpoon:list():select(1)
        end)
        vim.keymap.set("n", "<leader>hw", function()
          harpoon:list():select(2)
        end)
        vim.keymap.set("n", "<leader>he", function()
          harpoon:list():select(3)
        end)
        vim.keymap.set("n", "<leader>hr", function()
          harpoon:list():select(4)
        end)
        -- Navigate through Harpoon list
        vim.keymap.set("n", "<C-j>", function()
          harpoon:list():prev()
        end)
        vim.keymap.set("n", "<C-k>", function()
          harpoon:list():next()
        end)
      end,
}

