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
			"zenbones-theme/zenbones.nvim",
		},
		opts = { theme = "auto" },
		config = function(_, opts)
			setup_lualine({
				red = "#E06C75",
				orange = "#D19A66",
				yellow = "#E5C07B",
				purple = "#C678DD",
				bg = "#1d2021",
			})
		end,
	},

	{
		"thesimonho/kanagawa-paper.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("kanagawa-paper")
		end,
		opts = {},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	-- Add new color schemes here
}
