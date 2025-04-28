local builtin = require("telescope.builtin")

--
-- Generel
--
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>rr", ":source $MYVIMRC<CR>", { desc = "Reload Neovim Config" })

vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save File' })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a', { desc = 'Save File' })

-- Move line down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down", silent = true })

-- Move line up
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up", silent = true })

-- Move selected lines (visual mode)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })


-- Telescope

vim.keymap.set('n', '<leader>fb', ':Telescope file_browser<CR>', { desc = 'Open File Browser' })

-- Picker
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
-- vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
