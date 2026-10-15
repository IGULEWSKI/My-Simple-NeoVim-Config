return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
  },
  -- Wtyczka załaduje się dopiero po wpisaniu jednej z tych komend
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui"
    vim.g.db_ui_show_help = 0
  end,
  config = function()
    -- Automatyczne wpięcie autouzupełniania tabel i kolumn dla nvim-cmp
    local cmp_ok, cmp = pcall(require, "cmp")
    if cmp_ok then
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          cmp.setup.buffer({
            sources = {
              { name = "vim-dadbod-completion" },
              { name = "buffer" },
            },
          })
        end,
      })
    end
  end,
}
