--os.date("%H") returns the hour in 24 hour format
local hour = tonumber(os.date("%H"))
local day = (hour >= 6 and hour < 20)
local afternoon = (hour >= 14 and hour < 20)

return {
    --note that tokyonight and gruvbox don't share the same color scheme
    --configuration settings.
    {
        "rebelot/kanagawa.nvim",
        enabled = true,
        lazy = false,
        priority = 1000,

        config = function ()
            require('kanagawa').setup({
                functionStyle = {bold = true},
                colors = {
                    theme = {
                        all = {
                            ui = {
                                bg_gutter = "none"
                            }
                        }
                    }
                }
            })

            if not day then
                vim.cmd.colorscheme("kanagawa-dragon")
            end
        end
    },

    {
        "folke/tokyonight.nvim",
        enabled = true,
        lazy = false,
        priority = 900,
        config = function()
            require("tokyonight").setup({
                style = "moon",

                styles = {
                    comments = {
                        italic = true,
                    },
                    keywords = {
                        italic = true,
                    },
                    functions = {
                        bold = true,
                    },
                },

                --bold "NORMAL" "INSERT", etc.
                lualine_bold = true,

                -- make Telescope borderless, with some changes
                -- taken from https://github.com/folke/tokyonight.nvim#borderless-telescope-example
                on_highlights = function(hl, c)
                    local prompt = "#2d3149"
                    hl.TelescopeNormal = {
                        bg = c.bg_dark,
                        fg = c.fg_dark,
                    }
                    hl.TelescopeBorder = {
                        bg = c.bg_dark,
                        fg = c.bg_dark,
                    }
                    hl.TelescopePromptNormal = {
                        bg = prompt,
                    }
                    hl.TelescopePromptBorder = {
                        bg = prompt,
                        fg = prompt,
                    }
                    hl.TelescopePromptTitle = {
                        bg = prompt,
                        fg = prompt,
                    }
                    hl.TelescopePreviewTitle = {
                        -- changed from default to make preview title pop
                        bg = c.purple,
                        fg = c.bg_dark,
                    }
                    hl.TelescopeResultsTitle = {
                        bg = c.bg_dark,
                        fg = c.bg_dark,
                    }
                end,
            })

            --use tokyonight only between 06:00 and 19:59
            if day then
                if not afternoon then
                    vim.cmd.colorscheme("tokyonight-storm")
                else
                    vim.cmd.colorscheme("tokyonight-moon")
                end
            end
        end,
    },
}
