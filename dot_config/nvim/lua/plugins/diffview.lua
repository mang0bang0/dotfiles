return {
    "sindrets/diffview.nvim",
    cmd = {
        "DiffviewOpen",
        "DiffviewFileHistory",
    },
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    opts = {
        enhanced_diff_hl = true,
        icons = {
            fold_closed = "",
            fold_open = "",
        },
        signs = {
            fold_closed = "",
            fold_open = "",
        },
        view = {
            default = {
                -- shows which file is which version in winbar
                winbar_info = true,
            },
            file_history = {
                -- shows which file is which version in winbar
                winbar_info = true,
            },
        },
    }
}
