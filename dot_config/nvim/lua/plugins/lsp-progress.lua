return {
    "linrongbin16/lsp-progress.nvim",
    opts = {
        client_format = function(client_name, spinner, series_messages)
            return #series_messages > 0
                and (client_name .. " " .. spinner .. " " .. table.concat(
                    series_messages,
                    ", "
                ))
            or nil
        end,

        format = function(client_messages)
            -- icon: nf-fa-gear \uf013
            local sign = " "
            if #client_messages > 0 then
                return sign .. " " .. table.concat(client_messages, " ")
            end
            if #vim.lsp.get_active_clients() > 0 then
                return sign
            end
            return ""
        end,
    },
}
