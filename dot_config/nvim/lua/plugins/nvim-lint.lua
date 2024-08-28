return {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function ()
        require("lint").linters_by_ft = {
            fish = {"fish"},
            cpp = {"codespell"},
            hpp = {"codespell"},
        }

        vim.api.nvim_create_autocmd({"TextChanged"}, {
            callback = function ()
                require("lint").try_lint()
            end
        })

        vim.api.nvim_create_autocmd({"BufWritePost"}, {
            callback = function ()
                require("lint").try_lint()
            end
        })
    end
}
