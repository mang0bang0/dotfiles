-- the following 4 functions sets up custom status lines for LSPSaga outline
-- and Diffview
local function outlineReturn ()
    return "OUTLINE"
end

local function diffviewReturn ()
    return "DIFFVIEW FILES"
end

local function troubleReturn ()
    return "TROUBLE"
end

local function oilReturn ()
    return require("oil").get_current_dir()
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

local trouble = {
    sections = {
        lualine_a = {
            troubleReturn
        }
    },

    filetypes = {
        "trouble",
    }
}

local oil = {
    sections = {
        lualine_a = {
            oilReturn
        }
    },

    filetypes = {
        "oil",
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
            trouble,
            oil
        },

        options = {
            component_separators = { left = '|', right = '|'},
            section_separators = { left = '', right = ''},
        },

        sections = {
            lualine_c = {
                "filename",
                require("lsp-progress").progress
            },
            lualine_x = {
                {"datetime", style = "%m-%d %H:%M"},
                "filetype"
            },
        },
    },
}
