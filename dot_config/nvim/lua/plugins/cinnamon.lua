return {
    "declancm/cinnamon.nvim",
    config = function ()
        require("cinnamon").setup({
            options = {
                delay = 3,
                max_delta = {
                    time = 252
                }
            }
        })

        vim.keymap.set("n", "<C-U>", function() require("cinnamon").scroll("<C-U>zz") end)
        vim.keymap.set("n", "<C-D>", function() require("cinnamon").scroll("<C-D>zz") end)

        -- Disable scrolling for Oil buffers
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {"oil", "markdown", "text", "tex", "txt", "help", "man" },
            callback = function() vim.b.cinnamon_disable = true end,
        })
    end
}
