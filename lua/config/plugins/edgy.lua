return {
    "folke/edgy.nvim",
    event = "VeryLazy",
    init = function()
        vim.opt.laststatus = 3
        vim.opt.splitkeep = "screen"
    end,
    opts = {
    top = {
        -- Add bufferline to the top layout
        {
            ft = "bufferline",
            title = "Bufferline",
            size = { height = 1 }, -- Set height for bufferline
            filter = function(buf)
                return vim.bo[buf].buftype == "" -- Only show normal buffers
            end,
        },
    },
    bottom = {
        -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
        {
            ft = "toggleterm",
            size = { height = 0.4 },
            -- exclude floating windows
            filter = function(buf, win)
                return vim.api.nvim_win_get_config(win).relative == ""
            end,
        },
        {
            ft = "lazyterm",
            title = "LazyTerm",
            size = { height = 0.4 },
            filter = function(buf)
                return not vim.b[buf].lazyterm_cmd
            end,
        },
        "Trouble",
        {
            ft = "qf",
            title = "QuickFix" 
        },
        {
            ft = "help",
            size = { height = 20 },
            -- only show help buffers
            filter = function(buf)
                return vim.bo[buf].buftype == "help"
            end,
        },
        {
            ft = "spectre_panel",
            size = { height = 0.4 }
        },
    },
    left = {
        -- Neo-tree filesystem always takes half the screen height
        {
            title = "Neo-Tree",
            ft = "neo-tree",
            filter = function(buf)
                return vim.b[buf].neo_tree_source == "filesystem"
            end,
            size = { height = 0.5 },
        },
        {
            title = "Neo-Tree Git",
            ft = "neo-tree",
            filter = function(buf)
                return vim.b[buf].neo_tree_source == "git_status"
            end,
            pinned = true,
            collapsed = true, -- show window as closed/collapsed on start
            open = "Neotree position=right git_status",
        },
        {
            title = "Neo-Tree Buffers",
            ft = "neo-tree",
            filter = function(buf)
                return vim.b[buf].neo_tree_source == "buffers"
            end,
            pinned = true,
            collapsed = true, -- show window as closed/collapsed on start
            open = "Neotree position=top buffers",
        },
        {
            title = function()
                local buf_name = vim.api.nvim_buf_get_name(0) or "[No Name]"
                    return vim.fn.fnamemodify(buf_name, ":t")
                end,
            ft = "Outline",
            pinned = true,
            collapsed = true,
            open = "SymbolsOutlineOpen",
        },
    },
        right = {
            -- Add Copilot Chat to the right layout
            {
                ft = "copilot-chat",
                title = "Copilot Chat",
                size = { width = 50 }, -- Set width for Copilot Chat
            },
        },
    },
}
