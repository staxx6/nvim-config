--[[return {
  'signatureaghen/blink.cmp',
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  build = 'cargo build --release',
  opts = {
    keymap = { 
      preset = 'default',
      ['<C-d>'] = { 'hide_documentation', 'hide_signature', 'hide' },
      ['<C-space>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
      ['<C-f>'] = { 'show_documentation' },
      ['<C-s>'] = { 'show_signature' },
    },
    appearance = { nerd_font_variant = 'mono' },
    completion = {
      documentation = {
        auto_show = false,
     } 
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' }
  },
  opts_extend = { 'sources.default' },
  config = true
}
]]--

return {
  "saghen/blink.cmp",
  version = "1.*",
  build = "cargo build --release",
  opts = {
    keymap = {
      preset = "default",  -- take full control
      -- Show menu (map BOTH variants for Ctrl-Space)
      ["<C-g>"] = { 'show', 'show_documentation', 'hide_documentation' },
      ["<C-f>"] = { 'show_signature', 'hide_signature' }
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
    completion = {
      documentation = {
        auto_show = true,          -- turn on auto docs
        auto_show_delay_ms = 600,  -- wait 600ms before showing
        update_delay_ms = 80,      -- (optional) delay updates when you move selection
        -- treesitter_highlighting = false, -- uncomment if CPU spikes when opening docs
      },
    },
    signature = { enabled = true },
  },
  config = true,
}

