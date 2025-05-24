return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.o.background = "dark" -- or light
    vim.g.gruvbox_material_background = "hard" -- soft, medium, hard
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_foreground = "original" -- material, mix, original
    vim.cmd.colorscheme('gruvbox-material')
  end
}
