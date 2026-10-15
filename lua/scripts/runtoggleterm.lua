--This script will run code depending on extension using toggleterm
local function runcmd()
	local filepath = vim.fn.expand("%:p")
	local extension = vim.fn.expand("%:e")
	local filenoex = vim.fn.expand("%:p:r")	
	local dod
	if filenoex:sub(1, 1) == "/" then
		dod = ""
	else
		dod = "./"
	end
	local commands = {
		py = "python " .. filepath .. " && echo ''",
		cpp = "g++ -g " .. filepath .. " -o " .. filenoex .. " && " .. dod .. filenoex .. " && echo ''",
		c = "gcc -g " .. filepath .. " -o " .. filenoex .. " && " .. dod .. filenoex .. " && echo ''",
		hs = "ghc " .. filepath .. " -o " .. filenoex .. " && " .. dod .. filenoex .. " && echo ''",
	}
	if not commands[extension] then
		vim.notify("Nieobsługiwane rozszerzenie: " .. extension, vim.log.levels.WARN)
		return
	end
  vim.cmd("write")
	require("toggleterm").exec(commands[extension])
end
vim.keymap.set({ "n", "v" }, "<leader>r", runcmd, { desc = "Save and Run code" })
