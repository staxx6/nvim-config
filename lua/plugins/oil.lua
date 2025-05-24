return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  config = function()
    local oil = require("oil")
    oil.setup({
      columns = {
        "icon",
        "size",
        "mtime"
      },
      view_options = {
        show_hidden = true,
      },
      float = {
        preview_split = "left",
        default = true,
      }
    })
  end,
}
