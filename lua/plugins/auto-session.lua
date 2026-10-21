return {
  'rmagatti/auto-session',
   lazy = false,
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    auto_create = false,
    auto_restore = true,
    auto_restore_last_session = false,
    auto_save = true,
    enabled = true,
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },

    pre_save_cmds = { 'Neotree close' },
    pre_restore_cmds = { 'Neotree close' },
    post_restore_cmds = {
      function()
        require('neo-tree.ui.renderer').clean_invalid_neotree_buffers(true)
      end,
    },

    session_lens = {
      mappings = {
        delete_session = { "i", "<C-D>" },
        alternate_session = { "i", "<C-S>" },
        copy_session = { "i", "<C-Y>" }
      }
    }
  }
}
