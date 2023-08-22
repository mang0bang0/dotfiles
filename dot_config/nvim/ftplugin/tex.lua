--turns wrapping on and don't wrap in the middle of a word
vim.opt_local.wrap = true
vim.opt_local.linebreak = true

--turn on spellcheck
vim.opt_local.spell = true

--swap gj and gk with j and k, unless a count is given
vim.keymap.set({"n", "v"}, "j",
function()
    if vim.v.count == 0 then
        return "gj"
    else
        return "j"
    end
end, {expr = true, remap = false})

vim.keymap.set({"n", "v"}, "k",
function()
    if vim.v.count == 0 then
        return "gk"
    else
        return "k"
    end
end, {expr = true, remap = false})
