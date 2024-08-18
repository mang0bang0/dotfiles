return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        filter = function(mapping)
            return mapping.desc and mapping.desc ~= ""
        end,
        plugins = {
            spelling = {
                suggestions = 5,
            },
            presets = {
                operators = false,
                motions = false,
                text_objects = false,
            },
        },
        triggers = {
            {"<leader>", mode = {"n", "v"}},
            {"z=", mode = {"n", "i"}}
        },
        icons = {
            mappings = false,
        },
        disable = {
            ft = {
                "lazy",
                "mason",
                "neo-tree",
            }
        }
    }
}
