return {
  'nvim-telescope/telescope.nvim', branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require("telescope").setup({
      defaults = {
        prompt_prefix = " ",  -- Icon for the prompt
        selection_caret = " ",  -- Icon for the selected file/folder
        entry_prefix = "  ",  -- Extra indentation for entries
        initial_mode = "insert",  -- Start in insert mode for the prompt
        layout_strategy = "horizontal",  -- Layout style
        layout_config = {
          width = 0.75,  -- Set the width of the Telescope window
          height = 0.8,  -- Set the height of the Telescope window
        },
        color_devicons = true,
        file_ignore_patterns = {
          "node_modules",
          ".git"
        }
      },
      pickers = {
        find_files = {
          theme = "dropdown",  -- Set a nice dropdown theme for file search
        },
        live_grep = {
         theme = "ivy",  -- Use the ivy theme for live grep
        },
      },
      extensions = {
        file_browser = {
          mappings = {
            n = {
--              ["<C-f>"] = require("telescope.actions").find_files,  -- Custom mapping to search files
            }
          }
        }
      }
    })
  end,
}
