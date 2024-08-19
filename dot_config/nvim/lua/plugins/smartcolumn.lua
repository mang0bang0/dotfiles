return {
    "m4xshen/smartcolumn.nvim",
    event = "VeryLazy",
    opts = {
        colorcolumn = "80",
        disabled_filetypes = {
            "man",
            "help",
            "text",
            "markdown",
            "lazy",
            "mason",
            "checkhealth",
            "json",
            "tex",
        },

        custom_colorcolumn = {
            gitcommit = "72",
        },
    }
}
