return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
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
        timeout = 500,
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
    }
  end,
}
