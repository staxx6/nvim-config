local builtin = require("telescope.builtin")

-- Generel
vim.keymap.set("n", "<leader>rr", ":source $MYVIMRC<CR>", { desc = "Reload Neovim Config" })
vim.g.mapleader = " "

-- Telescope
-- Picker
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
