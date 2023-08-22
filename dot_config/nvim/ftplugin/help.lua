--turns wrapping on and don't wrap in the middle of a word
vim.opt_local.wrap = true
vim.opt_local.linebreak = true

--swap gj and gk with j and k
vim.keymap.set({"n", "v"}, "j", "gj", {remap = false})
vim.keymap.set({"n", "v"}, "gj", "j", {remap = false})
vim.keymap.set({"n", "v"}, "k", "gk", {remap = false})
vim.keymap.set({"n", "v"}, "gk", "k", {remap = false})
