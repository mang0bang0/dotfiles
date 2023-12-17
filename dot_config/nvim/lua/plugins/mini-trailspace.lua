return {
    "echasnovski/mini.trailspace",    
    version = '*',
    config = function ()
        require("mini.trailspace").setup()

        -- Set up autocmd to remove trailing whitespace and empty lines on save
        vim.api.nvim_create_autocmd({"BufWritePost"}, {
            callback = function ()
                MiniTrailspace.trim()
                MiniTrailspace.trim_last_lines()
            end
        })
    end
}
