--This script will run code depending on extension using toggleterm
local function runcmd()
	local filepath = vim.fn.expand("%:p")
	local extension = vim.fn.expand("%:e")
	local filenoex = vim.fn.expand("%:p:r")
  vim.cmd("write")
  local dod
  if filenoex:sub(1,1)=="/" then
    dod=""
  else
    dod="./"
  end
	local commands = {
		py = "python " .. filepath .. " && echo ''",
		cpp = "g++ -g " .. filepath .. " -o " .. filenoex .. " && " .. dod .. filenoex .. " && echo ''",
		c = "gcc -g " .. filepath .. " -o " .. filenoex .. " && " .. dod .. filenoex .. " && echo ''",
	}
	if not commands[extension] then
		print("Nieobsługiwane rozszerzenie: " .. extension)
		return
	end
  require("toggleterm").exec(commands[extension])
end
vim.keymap.set({ "n", "v" }, "<leader>r", runcmd, {desc = "Save and Run code"})
