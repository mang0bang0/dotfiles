return {
    "iamcco/markdown-preview.nvim",

    --not lazy loading because this is a VimL plugin
    --and I don't know how it interacts with lazy loading
    build = function()
        vim.fn["mkdp#util#install"]()
    end,

    init = function()
        vim.g.mkdp_browser = "/usr/bin/firefox"
    end,

    ft = "markdown",
}
