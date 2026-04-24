--catpuccin
return {
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("catppuccin")
	-- 	end,
	-- },

	{
		--rosepine
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},

	-- { 'https://gitlab.com/shmerl/neogotham.git', --neogotham
	--   lazy = false, -- to make sure it's loaded on startup
	--   priority = 1000, -- to load before other plugins
	--   config = function()
	--     vim.cmd.colorscheme('neogotham')
	--   end
	-- },
}
