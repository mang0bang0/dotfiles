return {
    --Mason
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = true,
    },

    --mason-lsp-config
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        --after adding a server here, go down to set it up
        opts = {
            ensure_installed = {
                "clangd",     --C, C++
                "pyright",    --Python
                "lua_ls",     --Lua
                "texlab",     --Latex
                "marksman",   --Markdown
            },
        },
    },

    --lsp-config
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
    },
}
