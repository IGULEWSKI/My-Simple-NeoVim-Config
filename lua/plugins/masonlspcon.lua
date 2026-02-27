return {
   {
    "mason-org/mason.nvim",
    opts = {},
  config = function()
    require("mason").setup()
  end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} }
    },
  config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls","pyright","clangd"}
      })
  end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("*",{
      capabilities=require('cmp_nvim_lsp').default_capabilities()})
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("pyright")
      vim.lsp.enable("clangd")
      vim.keymap.set('n','K',vim.lsp.buf.hover,{})
      vim.keymap.set('n','gd',vim.lsp.buf.definition,{})
      vim.keymap.set({'n','v'},'<leader>ca',vim.lsp.buf.code_action,{})
    end
  }
}
