return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  keys = {
    { "<C-v>", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard" },
  },
  opts = {
    default = {
      dir_path = "assets",
      file_name = "image-%Y%m%d-%H%M%S.png",
      clipboard = {
        cmd = {
          linux = "wl-paste --type image/png",
        },
      },
    },
  },
}
