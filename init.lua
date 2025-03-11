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
