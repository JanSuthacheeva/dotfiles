return (
  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function()
      require("neorg").setup({
        -- Tell Neorg what modules to load
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {
            config = {
              icon_preset = "basic",
              folds = false,
              icons = {
                code_block = {
                  conceal = true,
                }
              }
            }
          },
          ["core.ui"] = {},
          ["core.ui.calendar"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "$HOME/notes"
              }
            }
          },
          ["core.export"] = {},
          ["core.keybinds"] = {
            config = {
              default_keybinds = true,
              neorg_leader = "<Leader>o"
            }
          },
          ["core.presenter"] = {
            config = {
              zen_mode = "zen-mode"
            }
          }
        }
      })
    end
  }
)
