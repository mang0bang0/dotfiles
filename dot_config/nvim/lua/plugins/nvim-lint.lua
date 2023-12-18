return {
    "mfussenegger/nvim-lint",
    config = function ()
        require("lint").linters_by_ft = {
            sh = {"shellcheck"},
            bash = {"shellcheck"},
            fish = {"fish"},
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
