return {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-tree/nvim-web-devicons",
        "nvim-treesitter/nvim-treesitter",
        "lewis6991/gitsigns.nvim",
    },

    opts = {
        -- order follows the list of modules on https://dev.neovim.pro/lspsaga/
        -- some names are different between the website and the opts table

        -- breadcrumbs in winbar is nice, but is not great with multiple buffers
        symbol_in_winbar = {
            enable = false,
            separator = "  ",
        },

        -- call hierarchy isn't being used, not very useful for me as of
        -- July 2023

        code_action = {
            -- adds hunk operations into code actions window
            -- the code action symbol doesn't show up though
            extend_gitsigns = false,

            keys = {
                quit = "q",
            },
        },

        definition = {
            width = 0.7,
            height = 0.6,

            keys = {
                -- the edit keybind really is saying to open the peek def
                -- window in the current buffer

                -- vsplit keybind is good
                split = "<C-c>h",
            },
        },

        -- using Trouble for lsp diagnostics

        finder = {
            max_height = 0.6;
            left_width = 0.4;
            right_width = 0.4;

            -- show definition, references and implementations
            default = "def+ref+imp",

            -- you can technically move into the code window, but maybe
            -- just open it in the buffer to edit

            --vsplit and split are broken?
            keys = {
                toggle_or_open = "<CR>",
                --vsplit = "v",
                --split = "h",
                quit = "<ESC>"
            },
        },

        -- not using floating terminal

        -- hover docs aren't very helpful as of now when everything's in
        -- a man page, consider changing later

        -- not interested in number of implementations in virtual text

        lightbulb = {
            -- disable lightbulb in sign column
            sign = false;
        },

        -- as of d3ac8b9, the docs are wrong. Outline still works when
        -- symbol_in_winbar is turned off.
        outline = {
            detail = false,
            keys = {
                toggle_or_jump = "o",
                quit = "q",
            }
        },

        -- DO NOT USE PROJECT WIDE
        rename = {
            -- rename no longer opens with the word selected so you can
            -- chnage things instead of rewriting the entire name
            in_select = true,

            keys = {
                -- no good way to use single keybinds to quit since it
                -- interferes with regular vim bindings
                quit = "<C-c>",
            },
        },

        scroll_preview = {
            scroll_down = "<C-d>",
            scroll_up = "<C-u>",
        },

        ui = {
            expand = "",
            collapse = "",
            code_action = " ",
        },
    },
}
