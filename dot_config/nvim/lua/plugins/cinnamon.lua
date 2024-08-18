return {
    "declancm/cinnamon.nvim",
    config = function ()
        require("cinnamon").setup({
            keymaps = {
                basic = true,
            },
            options = {
                delay = 3,
                max_delta = {
                    time = 252
                }
            }
        })

        -- Disable scrolling for Oil buffers
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "oil",
            callback = function() vim.b.cinnamon_disable = true end,
        })
    end
}
