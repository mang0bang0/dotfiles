return {
    "lewis6991/gitsigns.nvim",

    opts = {
        current_line_blame_opts = {
            virt_text_pos = "right_align",
            -- if I'm explicitly toggling git blame on,
            -- I want to see it immediately
            delay = 0,
            ignore_whitespace = true,
        },
        -- It's possible to have Gitsigns bindings activate only when the buffer
        -- has git stuff. Gitsigns provides this on_attach function to do so.
        -- This is taken from https://github.com/lewis6991/gitsigns.nvim#keymaps
        -- with some changes to the keymaps themselves. Comments below explain what
        -- I think is going on with this provided code
        on_attach = function(bufnr)
            -- Shortens calling Gitsigns modules
            local gs = package.loaded.gitsigns

            -- This map() is extremely similar to vim.set.keymap(), except it adds
            -- the buffer number to the opts table. This allows the '[c' and ']c'
            -- bindings to only work for that one buffer with Gitsigns active
            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- The reason '[c' and ']c' are defined in on_attach is because they're
            -- not universal binds. They depend on the buffer, and require buffer
            -- specific things. If you load these into the general init.lua, then
            -- there won't be a chance to check if the window is in diff mode.
            map('n', ']c', function()
                -- vim.wo.diff is a boolean that is true when the buffer is being
                -- used in diff mode. This line makes it so that if we're in diff
                -- mode, we just use the ']c' binding that's already present for
                -- diff mode.
                if vim.wo.diff then return ']c' end
                -- otherwise, we async schedule next_hunk() using vim.schedule()
                -- instead of just calling it, because git could be slow
                vim.schedule(function() gs.next_hunk() end)
                -- you still need to return something, so <Ignore> here just makes
                -- it so that the keypress itself doesn't do anything, besides
                -- scheduling next_hunk() the moment it's ready.
                return '<Ignore>'
                -- expr = true makes it so that the function itself is evaluated, since
                -- most of the time you would just put text here, and it needs to be
                -- told to actually run this code
            end, {desc = "Git next hunk", expr = true})

            -- Same as above
            map('n', '[c', function()
                if vim.wo.diff then return '[c' end
                vim.schedule(function() gs.prev_hunk() end)
                return '<Ignore>'
            end, {desc = "Git previous hunk", expr = true})
        end
    },
}
