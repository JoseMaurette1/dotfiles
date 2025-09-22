local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
    
    -- Additional transparency for common UI elements
    vim.cmd('hi Directory guibg=NONE')
    vim.cmd('hi SignColumn guibg=NONE')
    vim.cmd('hi EndOfBuffer guibg=NONE')
    vim.cmd('hi NonText guibg=NONE')
    vim.cmd('hi SpecialKey guibg=NONE')
    vim.cmd('hi VertSplit guibg=NONE')
    vim.cmd('hi WinSeparator guibg=NONE')
    vim.cmd('hi StatusLine guibg=NONE')
    vim.cmd('hi StatusLineNC guibg=NONE')
    vim.cmd('hi TabLine guibg=NONE')
    vim.cmd('hi TabLineFill guibg=NONE')
    vim.cmd('hi TabLineSel guibg=NONE')
    vim.cmd('hi Pmenu guibg=NONE')
    vim.cmd('hi PmenuSel guibg=NONE')
    vim.cmd('hi PmenuSbar guibg=NONE')
    vim.cmd('hi PmenuThumb guibg=NONE')
    vim.cmd('hi CursorLine guibg=NONE')
    vim.cmd('hi CursorLineNr guibg=NONE')
    vim.cmd('hi Folded guibg=NONE')
    vim.cmd('hi FoldColumn guibg=NONE')
end

return {

    {
	-- "folke/tokyonight.nvim",
	-- config = function()
	--     vim.cmd.colorscheme "tokyonight"
	--     vim.cmd(' hi Directory guibg=NONE')
	--     vim.cmd(' hi SignColumn guibg=NONE')
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
	-- "mcauley-penney/techbase.nvim",
	-- config = function(_, opts)
	--     vim.cmd.colorscheme("techbase")
	-- end,
	-- priority = 1000
    },

    {
	"catppuccin/nvim",
	config = function(_, opts)
	    vim.cmd.colorscheme("catppuccin-macchiato")
	    enable_transparency()
	end,
	priority = 1000
    },


    {
	"nvim-lualine/lualine.nvim",
	dependencies = {
	    "nvim-tree/nvim-web-devicons",
	},
	opts = {
	    theme = 'catppuccin-macchiato',
	}
    },
}
	
