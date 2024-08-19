return {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    config = function ()
        require "ibl".setup({
            indent = {
                char = '│',
            },
            scope = {
                enabled = false,
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

        --[[
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

        require "ibl.hooks".register(
            require "ibl.hooks".type.SCOPE_HIGHLIGHT,
            require "ibl.hooks".builtin.scope_highlight_from_extmark
        )
        ]]--
    end
}
