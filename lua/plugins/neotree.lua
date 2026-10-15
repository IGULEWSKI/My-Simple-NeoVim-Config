return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
      "antosha417/nvim-lsp-file-operations",
    },
    lazy = false, -- neo-tree will lazily load itself
  config = function()
    require("lsp-file-operations").setup()
    vim.keymap.set('n','<C-n>',':Neotree filesystem reveal left <CR>')
    require("neo-tree").setup(
      {
        window = {
          position = "left",
          width = 30,
        },
        filesystem = { -- its for LSP integration like changing directory names in project
          bind_to_cwd=true,
          follow_current_file = {
            enabled=true,
          },
        },
      })
  end
}

