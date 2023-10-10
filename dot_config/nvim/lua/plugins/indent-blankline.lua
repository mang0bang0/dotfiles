return {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = "HiPhish/rainbow-delimiters.nvim",
    config = function ()
        require "ibl".setup({
            scope = {
                show_start = false,
                show_end = false,
            },
            exclude = {
                filetypes = {
                    "markdown",
                    "txt",
                    "lazy",
                }
            }
        })

        local highlight = {
            "RainbowDelimiterRed",
            "RainbowDelimiterYellow",
            "RainbowDelimiterBlue",
            "RainbowDelimiterOrange",
            "RainbowDelimiterGreen",
            "RainbowDelimiterViolet",
            "RainbowDelimiterCyan",
        }

        require "ibl".update { scope = { highlight = highlight } }

        local hooks = require "ibl.hooks"
        hooks.register(
            hooks.type.SCOPE_HIGHLIGHT,
            hooks.builtin.scope_highlight_from_extmark
        )
    end
}
