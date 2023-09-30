return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    --uses a different string in require, so change main
    main = "nvim-treesitter.configs",

    opts = {
        ensure_installed = {
            "arduino",
            "bash",
            "c",
            "cpp",
            "fish",
            "json",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "python",
            "vim",
            "vimdoc",
        },

        sync_install = false,

        auto_install = true,

        ignore_install = {"latex"},

        --turns on highlighting
        highlight = {
            enable = true,
        },
    },
}
