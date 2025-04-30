-- plugins
require("config.lazy")

-- keymaps
require("config.keymaps")

-- general settings
vim.opt.number = true
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set hlsearch") -- highlight search
vim.cmd("set ignorecase") -- for search
vim.cmd("set statusline=%F")
vim.api.nvim_set_hl(0, "Whitespace", { fg = "#5c6370" }) -- or any color you prefer
vim.opt.list = true
vim.opt.listchars = {
  tab = "▸ ",
  trail = "·",
  nbsp = "␣",
}

vim.o.guifont = "CaskaydiaCove Nerd Font:h12" -- not working?

-- lsp
vim.g.mason_shell = "powershell.exe";
vim.lsp.enable('luals');
vim.lsp.enable('typescript');

-- Autocompletion
vim.o.completeopt = "menu,menuone,noinsert,noselect"
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.lsp.completion.winborder = 'rounded'
    end

    if client:supports_method('textDocument/documentHighlight') then
      local autocmd = vim.api.nvim_create_autocmd
      local augroup = vim.api.nvim_create_augroup('lsp_highlight', {clear = false})

      vim.api.nvim_clear_autocmds({buffer = bufnr, group = augroup})

      autocmd({'CursorHold'}, {
        group = augroup,
        buffer = ev.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      autocmd({'CursorMoved'}, {
        group = augroup,
        buffer = ev.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

vim.o.winborder = 'rounded'


-- Scrolling

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      vim.api.nvim_win_set_cursor(0, mark)
      vim.cmd("normal! zz") -- center cursor (adjust scroll)
    end
  end,
})

-- start screen
--[[
vim.api.nvim_create_autocmd('VimEnter', {
	callback = function()
		if vim.fn.argc() == 0 then -- Only if no file is opened
			vim.cmd('enew') -- Open a new empty buffer
			vim.cmd('setlocal buftype=nofile')
			vim.cmd('setlocal bufhidden=wipe')
			vim.cmd('setlocal noswapfile')

			local width = vim.api.nvim_win_get_width(0)
			local height = vim.api.nvim_win_get_height(0)

			local text = {
				'Welcome to datVim',
				'',
				'1. Open file           :Telescope find_files',
				'2. Recent files        :Telescope oldfiles',
				'3. New file            :ene | startinsert',
				'4. Quit                :qa'
			}

			local centered_text = {}
			for _, line in ipairs(text) do
				local padding = math.floor((width - #line) / 2)
				table.insert(centered_text, string.rep(" ", padding) .. line)
			end

			local top_padding = math.floor((height - #centered_text) / 2)
			for _ = 1, top_padding do
				table.insert(centered_text, 1, "")
			end

			vim.api.nvim_buf_set_lines(0, 0, -1, false, centered_text)
		end
	end
})
]]
