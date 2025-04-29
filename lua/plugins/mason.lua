return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  config = function()
    require("mason").setup()

    local mr = require("mason-registry")
    local servers = {
      "typescript-language-server",
      "lua-language-server",
      "css-lsp",
      "html-lsp",
      "json-lsp",
      "clangd",
    }

    -- Warten bis Registry geladen ist
    if mr.refresh then
      mr.refresh(function()
        for _, server in ipairs(servers) do
          local ok, pkg = pcall(mr.get_package, server)
          if ok and not pkg:is_installed() then
            pkg:install()
          end
        end
      end)
    end
  end,
}
