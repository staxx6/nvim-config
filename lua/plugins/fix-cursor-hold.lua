return {
  'antoinemadec/FixCursorHold.nvim',
  init = function()
    vim.g.cursorhold_updatetime = 100  -- unabhängig von vim.o.updatetime
  end,
}
