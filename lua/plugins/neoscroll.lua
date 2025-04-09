return {
  "karb94/neoscroll.nvim",
  config = function()
    require("neoscroll").setup({
      easing_function = "cubic", -- Options: "quadratic", "cubic", "quartic", etc.
      hide_cursor = true,
      stop_eof = true,
      duration_multiplier = 0.2
    })
  end,
}
