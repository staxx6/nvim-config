return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
    { 'nvim-tree/nvim-web-devicons', enabled = true }, -- better icons NF onlyled = true
    { 'nvim-telescope/telescope-ui-select.nvim' }, -- use telescope for other selecion lists plugins or nvim own lists
  },
  config = function()
    local actions = require("telescope.actions")
    local telescope = require("telescope")
    local lga_actions = require("telescope-live-grep-args.actions")
    telescope.setup({
      defaults = {
        -- prompt_prefix = " ", -- Icon for the prompt
        selection_caret = " ", -- Icon for the selected file/folder
        entry_prefix = "  ", -- Extra indentation for entries
        initial_mode = "insert", -- Start in insert mode for the prompt
        layout_strategy = "vertical", -- Layout style
        layout_config = {
          vertical = { width = 0.9 }
        },
        layout_configX = {
          width = 0.85, -- Set the width of the Telescope window
          height = 0.8, -- Set the height of the Telescope window
        },
        color_devicons = true,
        file_ignore_patterns = {
          "node_modules",
          ".git"
        },
        debounce = 1000,
        mappings = {
          i = {
            ["<C-v>"] = actions.select_vertical,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-t>"] = actions.select_tab,
          }
        },

      },
      pickers = {
        find_files = {
          theme = "dropdown", -- Set a nice dropdown theme for file search
          hidden = true,
        },
        live_grep = {
          theme = "ivy", -- Use the ivy theme for live grep
          additional_args = function()
            return { "--hidden", "--smart-case", "--with-filename", "--line-number" }
          end,
        },
      },
      extensions = {
        live_grep_args = {
          auto_quoting = true,
          mappings = { -- extend mappings
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              -- freeze the current list and start a fuzzy search in the frozen list
              ["<C-space>"] = lga_actions.to_fuzzy_refine,
            },
          },
        },
        file_browser = {
          cwd_to_path = false,
          hidden = true,
          mappings = {
            ["i"] = {
              ["<C-r>"] = function()
                require("telescope").extensions.file_browser.file_browser({
                  cwd = "c:\\"
                })
              end,
            },
            ["n"] = {
              ["<C-r>"] = function()
                require("telescope").extensions.file_browser.file_browser({
                  cwd = "c:\\"
                })
              end,
            },
          }
        }
      }
    })
    telescope.load_extension("live_grep_args")
    telescope.load_extension("ui-select")
  end,
}
