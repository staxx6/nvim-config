return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  config = function()
    require("mason").setup()

    local mr = require("mason-registry")
    local servers = { "typescript-language-server", "lua-language-server", "css-lsp", "html-lsp", "json-lsp", "clangd" }

    for _, server in ipairs(servers) do
      local package = mr.get_package(server)
      if not package:is_installed() then
        package:install()
      end
    end
  end,
}
