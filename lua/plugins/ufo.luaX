return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        { "kevinhwang91/promise-async" },
    },
    event = "BufReadPost",
    config = function()
        -- Setup ufo
        require("ufo").setup({
            provider_selector = function(bufnr, filetype, buftype)
                -- Ufo not working together with virtual buffers
                -- if filetype == 'oil' then
                --    return nil
                -- end
                local has_ts = pcall(vim.treesitter.get_parser, bufnr)
                if not has_ts then
                  return { 'indent' } -- fallback
                end

                return { "lsp", "treesitter" }
            end,
        })

        -- Optional keymaps
        vim.keymap.set("n", "zV", require("ufo").openAllFolds, { desc = "Open all folds" })
        vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
    end,
}
