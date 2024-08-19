--os.date("%H") returns the hour in 24 hour format
local hour = tonumber(os.date("%H"))
local day = (hour >= 6 and hour < 20)

if day then
    return {
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
                vim.cmd.colorscheme("tokyonight-storm")
            end
        end,
    }
else
    return {
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
                },
                overrides = function(colors)
                    return {
                        MiniTrailspace = {bg = colors.palette.peachRed}
                    }
                end
            })

            if not day then
                vim.cmd.colorscheme("kanagawa-wave")
            end
        end
    }
end
