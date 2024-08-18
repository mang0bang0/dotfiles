return {
    "m4xshen/autoclose.nvim",
    event = "VeryLazy",
    opts = {
        options = {
            disable_when_touch = true,
        },
        keys = {
            --add a pair for $$, good for LaTeX
            ["$"] = { escape = true, close = true, pair = "$$", disable_command_mode = true, enabled_filetypes = {"tex"}},
            ["`"] = { escape = true, close = true, pair = "``", disable_command_mode = true, },
            --disable double and single quotes, causes more trouble
            ['"'] = { escape = false, close = false, pair = '""', disable_command_mode = true, },
            ["'"] = { escape = false, close = false, pair = "''", disable_command_mode = true, },
            ["("] = { escape = false, close = true, pair = "()", disable_command_mode = true },
            ["["] = { escape = false, close = true, pair = "[]", disable_command_mode = true },
            ["{"] = { escape = false, close = true, pair = "{}", disable_command_mode = true },
            [">"] = { escape = true, close = false, pair = "<>", disable_command_mode = true },
            [")"] = { escape = true, close = false, pair = "()", disable_command_mode = true },
            ["]"] = { escape = true, close = false, pair = "[]", disable_command_mode = true },
            ["}"] = { escape = true, close = false, pair = "{}", disable_command_mode = true },
        }
    }
}
