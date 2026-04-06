local function setup_lualine(colors)
	local lualine = require("lualine")
	local theme = require("lualine.themes.auto")

	theme.normal.a.bg = colors.orange
	theme.normal.a.fg = colors.bg
	theme.normal.a.gui = "bold"

	theme.insert.a.bg = colors.yellow
	theme.insert.a.fg = colors.bg
	theme.insert.a.gui = "bold"

	theme.visual.a.bg = colors.purple
	theme.visual.a.fg = colors.bg
	theme.visual.a.gui = "bold"

	theme.command.a.bg = colors.red
	theme.command.a.fg = colors.bg
	theme.command.a.gui = "bold"

	lualine.setup({ theme = theme })
end

return {
	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = { theme = "auto" },
		config = function(_, opts)
			setup_lualine(require("config.colors"))
		end,
	},

	{
		"folke/tokyonight.nvim",
		lazy = true,
	},

	{
		"smit4k/shale.nvim",
		name = "shale",
		lazy = true,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
