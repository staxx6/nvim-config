local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
if not is_windows then
  return {
    "natecraddock/telescope-zf-native.nvim"
  }
end

return {}
