return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        -- indent = {
          -- char = "┊", -- or try "┊", "¦", "▏"
        -- },
        scope = {
          enabled = true,
          show_start = true,
          show_end = true,
          highlight = { "Function", "Label" }, -- tweak colors
        },
      })
    end
  }
}
