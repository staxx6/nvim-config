return {
  "echasnovski/mini.map",
  version = "*",
  config = function()
    local map = require("mini.map")
    map.setup({
      symbols = {
        -- Use the 'block' variant for solid visual appearance
        encode = map.gen_encode_symbols.dot('4x2')
      },
      -- Optional: integrations for diagnostics, git, etc.
      integrations = {
        map.gen_integration.builtin_search(),
        map.gen_integration.diagnostic(),
        map.gen_integration.gitsigns(),
      },
    })
    map.open()
  end
}
