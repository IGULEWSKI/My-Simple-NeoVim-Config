return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      sql = { "sqlfluff" },
    }

    local sqlfluff = lint.linters.sqlfluff
    sqlfluff.args = {
      "lint",
      "--format=json",
      "--dialect=tsql",
      "--ignore=layout,structure,ambiguous",
      "-" -- Wymusza czytanie ze stdin (sprawdzanie "na żywo" w buforze)
    }
    sqlfluff.stdin = true

    -- Włączenie wirtualnego tekstu oraz podświetleń błędów w Neovimie
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
    })

    -- Automatyczne wyzwalanie lintera przy zmianach tekstu i wyjściu z trybu Insert
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave", "TextChanged" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
