return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false, -- Load immediately to ensure commands are available
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
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
        preserve_window_proportions = false,
        signcolumn = "yes",
      },
      renderer = {
        highlight_git = false,
        highlight_opened_files = "none",
        highlight_modified = "none",
        root_folder_label = false,
        indent_markers = {
          enable = true,
        },
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = false,
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
