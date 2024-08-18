-- TO DO:
-- 1. add space after comments
-- 2. split the file into several different ones
-- 3. check lazy load status of all plugins

-----------OPTIONS------------

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- use terminal colors, makes color scheme work
vim.opt.termguicolors = true

-- set background to dark for dark mode
vim.opt.background = "dark"

-- enable line numbers and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- always show the sign column (used by gitsigns)
vim.opt.signcolumn = "yes"

-- highlight when searching, use <leader>h to clear highlighting
vim.opt.hlsearch = true
-- incremental search that will highlight as you're searching
vim.opt.incsearch = true

-- ignore search case unless there is a capital letter present
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- keep 3 lines above and below cursor when it gets to the edge
vim.opt.scrolloff = 10

-- tab becomes 4 spaces
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 8
vim.opt.softtabstop = 0

-- split window behavior, default to right and down
vim.opt.splitbelow = true
vim.opt.splitright = true

-- set title of terminal
vim.opt.title = true

-- turn wrap off
vim.opt.wrap = false

-- keep wrapped text indented
vim.opt.breakindent = true

-- turn on cursorline to make it easier to see
vim.opt.cursorline = true

-- turn off saying "visual" and "insert" in the options line
vim.opt.showmode = false

-- allow visual block mode cursor to go anywhere
vim.opt.virtualedit = "block"

-- Turn on persistent undo
-- Default 1000 undos saved
vim.opt.undofile = true

-- let neovim think any .tex file is latex by default
vim.g.tex_flavor = "latex"

-- map leader is <spc>
vim.g.mapleader = " "

-- add fill chars to make Diffview look nice
vim.opt.fillchars:append{diff = "╱"}

-- C options for indenting during specific line breaks
vim.opt.cinoptions = "l1,(0,t0"

-------------LAZY-------------

--make sure to load lazy after key bindings, especially leader key
--bootstraps lazy
--plugins are not lazy loaded by default
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

--plugins are in a child directory
require("lazy").setup("plugins")

------------REMAPS------------

--map <spc>n to toggle between relative and normal line numbers
vim.keymap.set("n", "<leader>n",
    function()
        vim.wo.number = true
        vim.wo.relativenumber = not vim.wo.relativenumber
    end,
    {desc = "Toggle relative line numbers"}
)

--<spc>h to clear highlights
--<C-l> can also be used to clear highlights and cmdline
vim.keymap.set("n", "<leader>h", ":Telescope help_tags<CR>",
               {desc = "Telescope help", silent = true})

vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>",
               {desc = "Telescope files", silent = true})

--move to different windows with <Alt-{hjkl}>
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')

--change window location with <Alt-{HJKL}>
vim.keymap.set('n', '<A-H>', '<C-w>H')
vim.keymap.set('n', '<A-J>', '<C-w>J')
vim.keymap.set('n', '<A-K>', '<C-w>K')
vim.keymap.set('n', '<A-L>', '<C-w>L')

--set windows to equal size with <A-=>
vim.keymap.set('n', '<A-=>', '<C-w>=')

--paste last yanked with <spc>p, last yanked can always be found in register 0
vim.keymap.set({'n', 'v'}, '<leader>p', '"0p',
               {desc = "Paste last yanked", remap = true})
vim.keymap.set({'n', 'v'}, '<leader>P', '"0P',
               {desc = "Paste last yanked", remap = true})

-- Telescope
vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>",
               {desc = "Telescope files", silent = true})

vim.keymap.set("n", "<leader>F",
               ":Telescope find_files hidden=true no_ignore=true<CR>",
               {desc = "Telescope files (hidden)", silent = true})

vim.keymap.set("n", "<leader>/", ":Telescope live_grep<CR>",
               {desc = "Telescope grep", silent = true})

vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>",
               {desc = "Telescope buffers", silent = true})

vim.keymap.set("n", "<leader>*", ":Telescope grep_string<CR>",
               {desc = "Telescope string under cursor", silent = true})

vim.keymap.set("n", "<leader>m", ":Telescope man_pages<CR>",
               {desc = "Telescope man pages", silent = true})

vim.keymap.set("n", "<leader>u", ":Telescope undo<CR>",
               {desc = "Telescope undo history", silent = true})

-- Neotree
vim.keymap.set("n", "<leader>e", ":Oil --float .<CR>",  {desc = "File explorer", silent = true})

-- Zen mode
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>",
               {desc = "Zen mode", silent = true})

-- LSP related
vim.keymap.set("n", "<leader>x",
               ":Trouble diagnostics toggle filter.buf=0 focus=true<CR>",
               {desc = "Show buffer diagnostics", silent = true})

vim.keymap.set("n", "<leader>X", ":Trouble diagnostics toggle focus=true<CR>",
               {desc = "Show project diagnostics", silent = true})

vim.keymap.set("n", "<leader>l", ":Trouble lsp toggle focus=true<CR>",
               {desc = "Show LSP info", silent = true})

vim.keymap.set({"n","v"}, "<leader>c", function() vim.lsp.buf.code_action() end,
               {desc = "Code action"})

vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end,
               {desc = "Rename LSP"})

vim.keymap.set("n", "gd", ":Trouble lsp_definitions focus=true<CR>",
               {desc = "Go to def LSP"})

vim.keymap.set("n", "gD",  ":Trouble lsp_type_definitions focus=true<CR>",
               {desc = "Go to type def LSP"})

vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.hover() end,
               {desc = "Hover doc LSP"})

vim.keymap.set("n", "<leader>o", ":AerialToggle<CR>", {desc = "LSP Outline"})

-- Git
vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>",
               {desc = "Git stage hunk", silent = true})

vim.keymap.set("v", "<leader>gs", ":'<,'>Gitsigns stage_hunk<CR>",
               {desc = "Git stage hunk", silent = true})

vim.keymap.set("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>",
               {desc = "Git undo stage hunk", silent = true})

vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>",
               {desc = "Git reset hunk", silent = true})

vim.keymap.set("v", "<leader>gr", ":'<,'>Gitsigns reset_hunk<CR>",
               {desc = "Git reset hunk", silent = true})

vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>",
               {desc = "Git blame", silent = true})

vim.keymap.set("n", "<leader>gd", ":Gitsigns toggle_deleted<CR>",
               {desc = "Git show deleted", silent = true})

vim.keymap.set("n", "<leader>gD", ":DiffviewOpen<CR>",
               {desc = "Git diff2", silent = true})

vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>",
               {desc = "Git preview hunk", silent = true})

-------------CMP--------------

-- load nvim-cmp_config.lua next, after all other plugins are done
require("nvim-cmp_config")

-------------LSP--------------

--set nerdfont signs for LSP related things
vim.fn.sign_define("DiagnosticSignError",
{text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
{text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
{text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
{text = "󰌵", texthl = "DiagnosticSignHint"})

--Must advertise capabilities to every LSP server
--Add autocomplete capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()
--Add folding capabilities
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

--Bash
require("lspconfig").bashls.setup{
    capabilities = capabilities,
}

--C, C++
require("lspconfig").clangd.setup{
    capabilities = capabilities,
    cmd = {
        "clangd",
        -- when the autocomplete menu is open, "--header-insertion-decorators"
        -- adds a circle before library functions that have yet to be included.
        -- If you accept the completion it will add that #include. However,
        -- this makes it so the autocomplete text is misaligned. Setting the
        -- flag to false makes the dot not show up, with the tradeoff of not
        -- being able to know when it has auto-inserted lines.
        "--header-insertion-decorators=false",
    },
}

require("lspconfig").jsonls.setup{
    capabilities = capabilities,
}

--Lua
require("lspconfig").lua_ls.setup{
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua
                -- you're using (most likely LuaJIT in the case of
                -- Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Let language server recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                }
            },
        },
    },

    capabilities = capabilities,
}

-- LaTeX
require("lspconfig").texlab.setup{
    capabilities = capabilities,
}

--Markdown
require("lspconfig").marksman.setup{
    capabilities = capabilities,
}

--Python
require("lspconfig").pylsp.setup{
    capabilities = capabilities,
}
