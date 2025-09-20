local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
end
return {
    {
	-- "folke/tokyonight.nvim",
	-- config = function()
	--     vim.cmd.colorscheme "tokyonight"
	--     vim.cmd(' hi Directory guibg=NONE')
	--     vim.cmd(' hi SignColumn guibg=NONE')
	--     enable_transparency()
	-- end
    },
    {
	-- "Mofiqul/vscode.nvim",
	-- name = 'vscode',
	-- config = function()
	--     vim.cmd.colorscheme "vscode"
	--     vim.cmd('hi Directory guibg=NONE')
	--     vim.cmd('hi SignColumn guibg=NONE')
	--     enable_transparency()
	-- end
    },
    {
	"mcauley-penney/techbase.nvim",
	config = function(_, opts)
	    vim.cmd.colorscheme("techbase")
	end,
	priority = 1000
    },

    {
	-- "catppuccin/nvim",
	-- config = function(_, opts)
	--     vim.cmd.colorscheme("catppuccin")
	-- end,
	-- priority = 1000
    },


    {
	"nvim-lualine/lualine.nvim",
	dependencies = {
	    "nvim-tree/nvim-web-devicons",
	},
	opts = {
	    theme = 'techbase',
	}
    },
}
	
