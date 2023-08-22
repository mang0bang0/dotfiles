return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
        "debugloop/telescope-undo.nvim",
    },

    cmd = "Telescope",

    --need to use config instead of opts to load the fzf sorter
    config = function ()
        require("telescope").setup ({
            defaults = {
                --Appearance
                prompt_prefix = '󰍉 ',
                dynamic_preview_title = true,
                results_title = false,
                prompt_title = false,
                sorting_strategy = "ascending",

                layout_strategy = "flex",

                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.65,
                    },

                    vertical = {
                        prompt_position = "top",
                    },
                },

                initial_mode = "insert",

                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                },

                mappings = {
                    n = {
                        ["v"] = "select_vertical",
                        ["h"] = "select_horizontal",
                        ["t"] = "select_tab",
                        ["q"] = "close",


                        --Disable default keymaps to avoid polluting whichkey
                        ["<Up>"] = false,
                        ["<Down>"] = false,
                        ["<C-t>"] = false,
                        ["<M-q>"] = false,
                        ["<C-q>"] = false,
                        ["<C-v>"] = false,
                        ["<C-x>"] = false,
                    },

                    i = {
                        ["<C-k>"] = "move_selection_previous",
                        ["<C-j>"] = "move_selection_next",
                        ["<Down>"] = "cycle_history_next",
                        ["<Up>"] = "cycle_history_prev",

                        --Disable default keymaps to avoid polluting whichkey
                        ["<C-c>"] = false,
                        ["<C-l>"] = false,
                        ["<C-n>"] = false,
                        ["<C-p>"] = false,
                        ["<C-x>"] = false,
                        ["<C-t>"] = false,
                        ["<M-q>"] = false,
                        ["<C-q>"] = false,
                        ["<C-v>"] = false,
                    },
                },
            },

            pickers = {
                --change default to show more than sec 1 in manpages
                man_pages = {
                    sections = {"ALL"},
                },
            },

            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },

                undo = {
                    side_by_side = false,
                },
            },
        })

        require("telescope").load_extension("fzf")
        require("telescope").load_extension("undo")
    end
}
