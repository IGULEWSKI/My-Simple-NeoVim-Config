return {
	-- Commenting shortcut gc
	{ "numToStr/Comment.nvim", opts = {} },
	-- Rainbow Delimiters
	{
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
			require("rainbow-delimiters.setup").setup({
				blacklist = {
					"toggleterm",
					"NvimTree",
					"alpha",
					"TelescopePrompt",
					"telescope",
					"notify",
					"help",
					"lazy",
					"mason",
					"noice",
				},
			})
		end,
	},
	{ --ultimate autopair
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6", --recommended as each new version will have breaking changes
		opts = {
      --config here
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
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-_>]],
				direction = "horizontal",
				size = 10,
			})
		end,
	},
	{ -- bracket surround
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use main branch for latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty for defaults
			})
		end,
	},
} --koniec spec !!!!!!!!!!!!
