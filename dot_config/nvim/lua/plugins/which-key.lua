return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,

    -- Keybinds aren't set in this plugin, because keybinds shouldn't
    -- depend on a plugin being loaded to work, especially when this
    -- plugin is lazy-loaded
    config = function ()
        require("which-key").setup({
            plugins = {
                presets = {
                    operators = false,
                    motions = false,
                    text_objects = false,
                }
            },

            disable = {
                filetypes = {
                    "lazy",
                    "mason",
                    "sagaoutline",
                    "sagafinder",
                    "neo-tree",
                },
            },
        })

        require("which-key").register({
            g = {name = "Git"}}, {prefix = "<leader>"})
    end,
}
