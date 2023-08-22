return {
    "L3MON4D3/Luasnip",
    version = "2.*",
    -- not using jsregexp, so not building it here (yet?)

    -- while this plugin is very powerful, I'm not writing enough boilerplate
    -- to really need robust snippets. There are some kind of useful LSP
    -- snippets, but they're really not crucial

    -- calling this after cmp because of the structure of the recommended
    -- setup process
    dependencies = {
        "hrsh7th/nvim-cmp",
    }
}
