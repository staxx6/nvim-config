return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup({
      options = {
        show_close_icon = false,
        show_buffer_close_icons = false,
      }
    })

    vim.api.nvim_set_hl(0, "BufferLineFill", { bg = '#272727' })
  end
}
