return {
    --Twilight dims parts of code you're not working on
    --can be enabled to work with zen mode
    --doesn't work well, treesitter isn't perfect
    -- {
    --     "folke/twilight.nvim",
    --     opts = {
    --         context = 13,
    --     },
    --     lazy = true,
    -- },
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        opts = {
            window = {
                width = 100,
            }
        }
    }
}
