return {
    "stevearc/aerial.nvim",
    cmd = "AerialToggle",
    opts = {
        layout = {
            min_width = 0.15
        },

        keymaps = {
            ["v"] = "actions.jump_vsplit",
            ["h"] = "actions.jump_split",
        },

        highlight_on_jump = false,

        show_guides = true,
    }
}
