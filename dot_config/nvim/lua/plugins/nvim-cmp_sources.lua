return {
    ------------------------
    ---------NOTES----------
    ------------------------
    --Cmp is a little different. Include everything else first,then nvim-cmp,
    --then the two fuzzy finders.

    --The setup unfortunately makes it so that I need to make a new .lua file
    --just for configuring nvim-cmp. Can be found at ../../nvim-cmp_config.lua

    --probably not lazy loading these

    ------------------------
    --SOURCES and INCLUDES--
    ------------------------

    --fuzzy.nvim for fuzzy finding for the two fzf sources here
    {
        "tzachar/fuzzy.nvim",
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
        }
    },

    -------------
    --LSP RELATED
    -------------
    --show say, when you're writing a function, highlightingwhich argument you
    --are at in the function
    --ADDED (1)
    {
        "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    --ADDED (2)
    {
        "hrsh7th/cmp-nvim-lsp",
    },

    -------------
    --CMD RELATED
    -------------
    --command line mode in nvim, for '/' searches and commands
    {
        "hrsh7th/cmp-cmdline",
    },

    -------------
    ----PATH-----
    -------------
    {
        "hrsh7th/cmp-path",
    },

    ------------
    --CMP ITSELF
    ------------
    --nvim-cmp itself, don't set up just yet!
    {
        "hrsh7th/nvim-cmp",
    },

    --------------
    --FUZZY FINDER
    --------------
    --fuzzy find in buffer
    --ADDED (3)
    {
        "tzachar/cmp-fuzzy-buffer",
        dependencies = {
            "hrsh7th/nvim-cmp",
            "tzachar/fuzzy.nvim",
        },
    },
}
