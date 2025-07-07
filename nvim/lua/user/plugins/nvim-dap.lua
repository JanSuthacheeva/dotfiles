return {
  ({
    'mfussenegger/nvim-dap',
    config = function ()
    end
  }),

  ({
    "theHamsta/nvim-dap-virtual-text",
    dependencies =  "mfussenegger/nvim-dap",
    config = function ()
      require("nvim-dap-virtual-text").setup()
    end
  }),

  ({
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    config = function ()
      require("dap.ui")
    end
  })
}
