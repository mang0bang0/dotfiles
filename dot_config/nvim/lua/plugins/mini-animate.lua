return {
    "echasnovski/mini.animate",
    version = '*',
    opts = {
        cursor = {
            enable = false,
        },

        scroll = {
            enable = true,
            timing = function(_, n) return 150 / n end,
        },

        resize = {
            enable = false,
        },

        open = {
            enable = false,
        },

        close = {
            enable = false,
        },
    },
}
