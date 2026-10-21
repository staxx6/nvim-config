return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- auto-update parsers
  event = { "BufReadPost", "BufNewFile" }, -- load treesitter when you open a file
  config = function()
    local is_windows = vim.loop.os_uname().sysname == "Windows_NT"

    if is_windows then
      require("nvim-treesitter.install").compilers = { "zig" }
    end

    require("nvim-treesitter.configs").setup({
      -- parsers you want installed
      ensure_installed = { "lua", "python", "javascript", "html", "css", "bash", "json", "markdown", "typescript", "cpp"}, 
      sync_install = true,
      
      highlight = {
        enable = true, -- enable syntax highlighting
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true, -- better auto-indent
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn", -- start selection
          node_incremental = "grn", -- expand selection
          node_decremental = "grm", -- shrink selection
          scope_incremental = "grc", -- expand to scope
        },
      },
      
      -- rainbow brackets (optional)
      rainbow = {
        enable = true,
        extended_mode = true,
      },
    })
  end,
}

