return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local none_ls = require('null-ls')
    local helpers = require("null-ls.helpers")

    local jq_format = helpers.make_builtin({
      name = "jq",
      meta = {
        url = "https://stedolan.github.io/jq/",
        description = "jq is a lightweight and flexible command-line JSON processor.",
      },
      method = none_ls.methods.FORMATTING,
      filetypes = { "json" },
      generator_opts = {
        command = "jq",
        args = { "." },
        to_stdin = true,
      },
      factory = helpers.formatter_factory,
    })

    none_ls.setup({
      sources = {
        jq_format,
      },
    })
  end,
}
