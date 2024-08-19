return {
    "stevearc/oil.nvim",
    cmd = "Oil",
    opts = {
        use_default_keymaps = false,
        keymaps = {
            ["<leader>?"] = "actions.show_help",
            ["<leader>p"] = "actions.preview",
            ["<leader>e"] = "actions.close",
            ["<leader>s"] = "actions.change_sort",
            ["<leader>H"] = "actions.toggle_hidden",
            ["<leader>."] = "actions.cd",
            ["<leader>r"] = "actions.refresh",
            ["<BS>"]      = "actions.parent",
            ["<CR>"]      = "actions.select",
            ["<leader>v"] = {"actions.select",
                             opts = {vertical = true},
                             desc = "Open file in vsplit"},
            ["<leader>h"] = {"actions.select",
                             opts = {horizontal = true},
                             desc = "Open file in split"},
            ["<leader>t"] = {"actions.select",
                             opts = {tab = true},
                             desc = "Open file in tab"},
        },
        columns = {
            "icon",
            "permissions",
        },
        watch_for_changes = true,
    }
}
