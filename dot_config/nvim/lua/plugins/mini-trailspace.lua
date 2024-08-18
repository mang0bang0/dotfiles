return {
    "echasnovski/mini.trailspace",
    version = '*',
    event = "VeryLazy",
    config = function ()
        require("mini.trailspace").setup()

        -- Set up autocmd to remove trailing whitespace and empty lines on save
        vim.api.nvim_create_autocmd({"BufWritePre"}, {
            callback = function ()
                MiniTrailspace.trim()
                MiniTrailspace.trim_last_lines()
            end
        })
    end
}
