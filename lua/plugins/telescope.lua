return {
  'nvim-telescope/telescope.nvim',
  -- branch = '0.1.x',
  branch = 'master',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
    { 'nvim-tree/nvim-web-devicons',            enabled = true }, -- better icons NF onlyled = true
    { 'nvim-telescope/telescope-ui-select.nvim' },                -- use telescope for other selecion lists plugins or nvim own lists
  },
  config = function()
    local actions = require("telescope.actions")
    local telescope = require("telescope")
    local lga_actions = require("telescope-live-grep-args.actions")
    telescope.setup({
      defaults = {

        file_sorter = require('telescope.sorters').get_fzf_sorter,
        generic_sorter = require('telescope.sorters').get_fzf_sorter,

        prompt_prefix = "  ", -- Icon for the prompt
        selection_caret = " ", -- Icon for the selected file/folder
        entry_prefix = "  ", -- Extra indentation for entries. selection makes spaces
        initial_mode = "insert", -- Start in insert mode for the prompt
        results_title = "",
        prompt_title = "",
        dynamic_preview_title = false,
        border = true,
        borderchars = {
          prompt = { '', '', '', '', '', '', '', '' },
          results = { '', '', '', '', '', '', '', '' },
          preview = { '', '', '', '', '', '', '', '' },
        },
        -- winblend = 3,
        layout_strategy = "flex", -- Layout style
        layout_config = {
          width = 0.8,
          height = 0.8,
          prompt_position = 'bottom',
          preview_cutoff = 1,
          -- preview_height = 0.4,
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
          -- path_display = { 'filename_first' }
          path_display = function()
            return "test"
          end
        },
        live_grep = {
          theme = "ivy", -- Use the ivy theme for live grep
          additional_args = function()
            return { "--hidden", "--smart-case", "--with-filename", "--line-number" }
          end,
        },
      },
      extensions = {
        ---@module 'frecency'
        ---@type FrecencyOpts
        frecency = {
          --  layout_strategy = "vertical", -- Layout style
          show_filter_column = false,
          -- path_display = { 'truncate' },
          path_display = { 'filename_first' },
        },
        live_grep_args = {
          auto_quoting = true,
          mappings = { -- extend mappings
            ["<C-k>"] = lga_actions.quote_prompt(),
            i = {
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

    -- Set picker colors

    -- Dynamically get background color and darken it slightly
    local function darken(hex, percent)
      local r = tonumber(hex:sub(2, 3), 16)
      local g = tonumber(hex:sub(4, 5), 16)
      local b = tonumber(hex:sub(6, 7), 16)
      r = math.floor(r * (1 - percent))
      g = math.floor(g * (1 - percent))
      b = math.floor(b * (1 - percent))
      return string.format("#%02x%02x%02x", r, g, b)
    end

    local hl = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
    if hl and hl.bg then
      local bg_hex = string.format("#%06x", hl.bg)
      local darker = darken(bg_hex, 0.05)
      local more_darker = darken(bg_hex, 0.20)
      local results = darken(bg_hex, 0.10)

      -- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = '#ffaaaa' })
      vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = darker }) -- previewBorder fg not working - this is the workaround
      vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = more_darker })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = more_darker, fg = more_darker })
      vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = results })
      vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = results, fg = results })
      vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = darker })
      vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = darker, fg = darker })

    end

    telescope.load_extension("live_grep_args")
    telescope.load_extension("ui-select")
  end,
}
