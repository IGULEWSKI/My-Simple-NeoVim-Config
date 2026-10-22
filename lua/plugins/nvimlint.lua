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
			"--force", -- Wymusza analizę plików w /tmp/ bez rozszerzenia .sql
			"--ignore=capitalisation,layout,structure,ambiguous", -- Wyłącza czepianie się małych liter, formatowania i gwiazdek
			"-", -- Wymusza czytanie ze stdin
		}
		sqlfluff.stdin = true

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave", "TextChanged" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
