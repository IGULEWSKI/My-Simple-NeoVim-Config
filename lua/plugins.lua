return {
	-- Commenting shortcut gc
	{ "numToStr/Comment.nvim", opts = {} },
	--Rainbow
	{ "HiPhish/rainbow-delimiters.nvim" },
	{ --ultimate autopair
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6", --recommended as each new version will have breaking changes
		opts = {
			--Config goes here
		},
	},
	{
		"goolord/alpha-nvim",
		-- dependencies = { 'nvim-mini/mini.icons' },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local startify = require("alpha.themes.startify")
			-- available: devicons, mini, default is mini
			-- if provider not loaded and enabled is true, it will try to use another provider
			startify.file_icons.provider = "devicons"
			require("alpha").setup(startify.config)
		end,
	},
} --koniec spec !!!!!!!!!!!!
