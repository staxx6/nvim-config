local builtin = require("telescope.builtin")

--
-- Generel
--
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>rr", ":source $MYVIMRC<CR>", { desc = "Reload Neovim Config" })

vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save File' })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a', { desc = 'Save File' })
vim.keymap.set('n', '<leader-w>', '<Esc>:w<CR>a', { desc = 'Save File 2' })

-- Move line down
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==", { desc = "Move line down", silent = true })

-- Move line up
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", { desc = "Move line up", silent = true })

-- Move selected lines (visual mode)
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })


-- Telescope

vim.keymap.set('n', '<leader>fb', ':Telescope file_browser<CR>', { desc = 'Open File Browser' })
vim.keymap.set('n', '<leader>;;', function()
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    previewer = true,
    winblend = 10,
  }))
end, { desc = 'Fuzzy search in current buffer' })
vim.keymap.set("n", "<leader>/", function()
  require("telescope.builtin").current_buffer_fuzzy_find()
end, { desc = "Fuzzy find in current buffer" })

-- Picker
--vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>ff", ':Telescope frecency workspace=CWD<CR>', { desc = "Find Files" })
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
-- vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fg", function()
  require("telescope").extensions.live_grep_args.live_grep_args()
end, { desc = "Live Grep with Args" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
vim.keymap.set("n", "<leader>km", "<cmd>Telescope keymaps<CR>", { desc = "Search keymaps" })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Find existing buffers' })


-- Autocomplete
-- vim.keymap.set("i", "<C-f>", "<C-x><C-o>", { noremap = true, silent = true, desc = "Auto completion" })

-- lsp
vim.keymap.set("n", "<leader>ft", function()
  vim.lsp.buf.format()
end, { desc = "Format file with lsp"})

-- oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Oil : Open parent directory"})
vim.keymap.set("n", "<space>-", require("oil").toggle_float, { desc = "Oil : Open parent directory FLOAT"})

-- git
vim.keymap.set('n', '<leader>gh', function()
  require('gitsigns').preview_hunk()
end, { desc = "Preview Git hunk under cursor" })

-- undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
