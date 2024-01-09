-- the following 4 functions sets up custom status lines for LSPSaga outline
-- and Diffview
local function outlineReturn ()
    return "Outline"
end

local function diffviewReturn ()
    return "Diffview Files"
end

local outline = {
    sections = {
        lualine_a = {
            outlineReturn
        }
    },

    filetypes = {
        "aerial",
    }
}

local diffviewFiles = {
    sections = {
        lualine_a = {
            diffviewReturn
        }
    },

    filetypes = {
        "DiffviewFiles",
    }
}

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    opts = {
        extensions = {
            "neo-tree",
            "lazy",
            "man",
            "trouble",
            outline,
            diffviewFiles,
        },

        options = {
            component_separators = { left = '|', right = '|'},
            section_separators = { left = '', right = ''},
        },

        sections = {
            lualine_x = {
                {"datetime", style = "%m-%d %H:%M"},
                "filetype"
            },
        },
    },
}
