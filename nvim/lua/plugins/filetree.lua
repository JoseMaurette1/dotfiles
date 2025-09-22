return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false, -- Load immediately to ensure commands are available
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- Make nvim-tree transparent
    vim.cmd('hi NvimTreeNormal guibg=NONE')
    vim.cmd('hi NvimTreeNormalNC guibg=NONE')
    vim.cmd('hi NvimTreeEndOfBuffer guibg=NONE')
    vim.cmd('hi NvimTreeWinSeparator guifg=#3c4048')
    
    require("nvim-tree").setup {
      disable_netrw = true,
      hijack_netrw = true,
      open_on_tab = false,
      hijack_cursor = false,
      update_cwd = true,
      diagnostics = {
        enable = true,
        icons = {
          hint = "󰌵",
          info = "󰋽",
          warning = "󰀪",
          error = "󰅚",
        },
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      git = {
        enable = true,
        ignore = true,
      },
      view = {
        width = 30,
        side = "left",
        number = false,
        relativenumber = false,
      },
      renderer = {
        highlight_git = true,
        root_folder_label = ":~:s?$?/..?",
        indent_markers = {
          enable = true,
        },
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "󰈚",
            symlink = "󰌵",
            folder = {
              default = "󰉋",
              open = "󰝰",
              empty = "󰉊",
              empty_open = "󰝰",
              symlink = "󰉋",
              symlink_open = "󰝰",
            },
            git = {
              unstaged = "󰄱",
              staged = "󰱒",
              unmerged = "󰘬",
              renamed = "󰁕",
              untracked = "󰞘",
              deleted = "󰮯",
              ignored = "󰛟",
            },
          },
        },
      },
      filters = {
        dotfiles = false,
        custom = {},
        exclude = {},
      },
      trash = {
        cmd = "trash",
        require_confirm = true,
      },
      live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = true,
      },
      log = {
        enable = false,
        truncate = true,
        types = {
          all = false,
          config = false,
          copy_paste = false,
          dev = false,
          diagnostics = false,
          git = false,
          profile = false,
          watcher = false,
        },
      },
      -- Performance optimizations
      respect_buf_cwd = true,
      sync_root_with_cwd = true,
      reload_on_bufenter = false,
    }
    
    -- Ensure toggle works properly
    vim.api.nvim_create_autocmd("BufEnter", {
      nested = true,
      callback = function()
        if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
          vim.cmd "quit"
        end
      end
    })
    
    -- Ensure main buffer stays transparent when file tree opens
    vim.api.nvim_create_autocmd("WinEnter", {
      callback = function()
        -- Re-apply transparency to main buffer when file tree is visible
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
      end
    })
    
    -- Additional autocmd for when nvim-tree buffer is created
    vim.api.nvim_create_autocmd("BufWinEnter", {
      pattern = "NvimTree_*",
      callback = function()
        -- Ensure main buffer transparency when tree opens
        vim.defer_fn(function()
          vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
          vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
          vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
          vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
        end, 10)
      end
    })
    
    -- Create user commands for easier access
    vim.api.nvim_create_user_command("NvimTreeToggle", function()
      require("nvim-tree.api").tree.toggle()
    end, { desc = "Toggle NvimTree" })
    
    vim.api.nvim_create_user_command("NvimTreeFindFile", function()
      require("nvim-tree.api").tree.find_file()
    end, { desc = "Find current file in NvimTree" })
    
    vim.api.nvim_create_user_command("NvimTreeFocus", function()
      require("nvim-tree.api").tree.focus()
    end, { desc = "Focus NvimTree" })
    
    vim.api.nvim_create_user_command("NvimTreeRefresh", function()
      require("nvim-tree.api").tree.reload()
    end, { desc = "Refresh NvimTree" })
  end,
}
