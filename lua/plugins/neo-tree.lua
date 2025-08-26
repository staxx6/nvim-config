return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    opts = {
      window = {
        mappings = {
          ["/"] = "noop"
        }
      },
      close_if_last_window = true,
      filesystem = {
        follow_current_file = { enabled = false },
        hijack_netrw_behavior = "open_default",
        filtered_items = { hide_dotfiles = false, hide_gitignored = true },
        use_libuv_file_watcher = true,
      },
    }
  }
}
