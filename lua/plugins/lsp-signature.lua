return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {
    hint_enable = false,      -- disable inline hints (optional)
    floating_window = true,   -- show as floating window
    handler_opts = {
      border = "rounded"
    }
  },
  config = function(_, opts)
    require("lsp_signature").setup(opts)
  end
}
