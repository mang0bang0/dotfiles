return {
    --nui needed for neo-tree and nowhere else
    {
        "MunifTanjim/nui.nvim",
        lazy = true,
    },

    --neo-tree itself
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",

        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons"
        },

        --lazy load on :Neotree to open neo-tree
        cmd = {"Neotree"},

        opts = {
            close_if_last_window = true,

            --show hidden files in linux (dotfiles)
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                },
            },

            window = {
                width = 30,
                --KEYBINDS
                mappings = {
                    --disable fuzzy finding
                    ["/"] = "noop",
                    --disable fuzzy sorting
                    ["#"] = "noop",
                    --disable fuzzy finding directories
                    ["D"] = "noop",
                    --disable clear filter
                    ["<c-x>"] = "noop",
                    --change vertical split from "s" to "v"
                    ["s"] = "noop",
                    ["v"] = "open_vsplit",
                    --change horizontal split from "S" to "h"
                    ["S"] = "noop",
                    ["h"] = "open_split",
                    --change "c" from copy (typing) to close directory
                    --unbind "C", see new bind "Y" for copying (typing)
                    ["c"] = "close_node",
                    ["C"] = "noop",
                    --unbind focus preview, can't get out
                    ["l"] = "noop",
                    --use "m" for cut/moving (visual) rather than typing
                    --use "M" for cut with typing
                    --unbind old bind x
                    ["m"] = "cut_to_clipboard",
                    ["M"] = "move",
                    ["x"] = "noop",
                    --use "Y" for copying (typing)
                    ["Y"] = "copy",
                },
            },
        },
    },
}
