return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mfussenegger/nvim-dap-python", --Tutaj dodaje debugger pluginy do języków
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		require("dapui").setup() -- Tutaj muszę setupować każdy debugger plugin
		--Python
		require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
		--C/Cpp
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
				args = { "--port", "${port}" },
			},
		}

		-- Konfiguracja dla konkretnych języków
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}
		dap.configurations.c = dap.configurations.cpp
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<leader>dc", dap.continue, {})
		vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
		vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
	end,
}
