--find defautls at:
--https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/default.lua
local cmp = require("cmp")
local compare = require("cmp.config.compare")

return {
    cmp.setup({
        mapping = {
            -- different directions for different modes, since we flip the
            -- menu in cmdline mode. See the view table in this func
            ["<C-j>"] = cmp.mapping(
                {
                    i = cmp.mapping.select_next_item(),
                    c = cmp.mapping.select_prev_item(),
                }
            ),
            ["<C-k>"] = cmp.mapping(
                {
                    i = cmp.mapping.select_prev_item(),
                    c = cmp.mapping.select_next_item(),
                }
            ),
            ["<Tab>"] = cmp.mapping(
                cmp.mapping.confirm({select = true}),
                {"i", "c"}
            ),
            ["<C-c>"] = cmp.mapping(
                cmp.mapping.abort(),
                {"i", "c"}
            ),
            ["<C-u>"] = cmp.mapping(
                cmp.mapping.scroll_docs(-4),
                {"i", "c"}
            ),
            ["<C-d>"] = cmp.mapping(
                cmp.mapping.scroll_docs(4),
                {"i", "c"}
            ),
        },

        --use luasnip as the snippet engine, required to insert any snippets
        --like LSP snippets
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },

        --start completing after 2 characters
        completion = {
            keyword_length = 2,
        },

        --for general places to autocomplete, vs. cmdline which we do later
        sources = cmp.config.sources(
            { {name = "nvim_lsp_signature_help", group_index = 1}, },
            { {name = "nvim_lsp", group_index = 1}, },
            { {name = "fuzzy_buffer", group_index = 2}, },
            { {name = "path", group_index = 2}, }
        ),

        --formatting uses lspkind
        formatting = {
            format = require("lspkind").cmp_format({
                --show symbols, then some text describing it after
                mode = 'symbol_text',
                --set max width of popup in characters
                maxwidth = 50,
                --truncates results over maxwidth with "..."
                ellipsis_char = '...',
                --shows where the results came from
                menu = ({
                    nvim_lsp_signature_help = "[LSP]",
                    nvim_lsp = "[LSP]",
                    fuzzy_buffer = "[BUFR]",
                    path = "[PATH]",
                })
            })
        },

        --command mode autocomplete menu shows bottom up
        --technically works for all modes, but with a scrolloff of
        --13 I am not so limited in space that the completion menu
        --needs to go up
        view = {
            entries = {
                name = "custom",
                selection_order = "near_cursor",
            },
        },

        --needed to make fuzzy buffer work
        sorting = {
            priority_weight = 2,
            comparators = {
                --don't worry about messing up ordering
                --fuzzy buffer compare returns nil if it's not comparing
                --between fuzzy buffer results
                require("cmp_fuzzy_buffer.compare"),
                compare.offset,
                compare.exact,
                compare.score,
                compare.recently_used,
                compare.kind,
                compare.sort_text,
                compare.length,
                compare.order,
            },
        },

        experimental = {
            ghost_text = true,
        }
    }),

    --setting up search in command mode
    cmp.setup.cmdline("/", {
        sources = {
            {name = "nvim_lsp",},
            {name = "fuzzy_buffer",},
        }
    }),

    --setting up commands in command mode
    cmp.setup.cmdline(":", {
        sources = {
            {name = "nvim_lsp",},
            {name = "cmdline",},
        }
    }),
}
