return {
    "folke/trouble.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    cmd = "Trouble",

    opts = {
        auto_close = true,
        keys = {
            h = "jump_split",
            v = "jump_vsplit",
        }
    }
}
