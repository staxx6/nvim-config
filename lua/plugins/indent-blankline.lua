return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        --indent = {
        -- char = "·", -- or try "┊", "¦", "▏"
        -- },
        scope = {
          enabled = false,
          highlight = { "Function", "Label" }, -- tweak colors
        },
      })
    end
  }
}
