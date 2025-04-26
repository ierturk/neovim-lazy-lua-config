-- Utility plugins

return {
    {
        "nvim-telescope/telescope.nvim", -- Fuzzy finder
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup()
        end,
    },
    {
        "zbirenbaum/copilot.lua", -- Enhanced Copilot integration
        config = function()
            require("copilot").setup({
                suggestion = { enabled = true },
                panel = { enabled = true },
            })
        end,
    },
    {
        "zbirenbaum/copilot-cmp", -- Copilot integration with nvim-cmp
        dependencies = { "zbirenbaum/copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim", -- Copilot Chat plugin
        branch = "main",
        cmd = "CopilotChat",
        opts = function()
            local user = vim.env.USER or "User"
            user = user:sub(1, 1):upper() .. user:sub(2)
            return {
                auto_insert_mode = true,
                question_header = "  " .. user .. " ",
                answer_header = "  Copilot ",
                window = {
                    width = 0.4,
                },
            }
        end,
        keys = {
            { "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
            { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
            {
                "<leader>aa",
                function()
                    return require("CopilotChat").toggle()
                end,
                desc = "Toggle (CopilotChat)",
                mode = { "n", "v" },
            },
            {
                "<leader>ax",
                function()
                    return require("CopilotChat").reset()
                end,
                desc = "Clear (CopilotChat)",
                mode = { "n", "v" },
            },
            {
                "<leader>aq",
                function()
                    vim.ui.input({
                        prompt = "Quick Chat: ",
                    }, function(input)
                        if input ~= "" then
                            require("CopilotChat").ask(input)
                        end
                    end)
                end,
                desc = "Quick Chat (CopilotChat)",
                mode = { "n", "v" },
            },
            {
                "<leader>ap",
                function()
                    require("CopilotChat").select_prompt()
                end,
                desc = "Prompt Actions (CopilotChat)",
                mode = { "n", "v" },
            },
        },
        config = function(_, opts)
            local chat = require("CopilotChat")

            vim.api.nvim_create_autocmd("BufEnter", {
                pattern = "copilot-chat",
                callback = function()
                    vim.opt_local.relativenumber = false
                    vim.opt_local.number = false
                end,
            })

            chat.setup(opts)
        end,
    },
    {
        "christoomey/vim-tmux-navigator", -- Seamless navigation between Tmux and Neovim
        enabled = true,
        lazy = false, -- Load immediately
    },

{
    "folke/edgy.nvim", -- Edge window manager
    enabled = true, -- Enable edgy.nvim
    optional = true,
    opts = function(_, opts)
        -- Add copilot-chat to the right section
        opts.right = opts.right or {}
        table.insert(opts.right, {
            ft = "copilot-chat",
            title = "Copilot Chat",
            size = { width = 50 },
        })

        -- Add toggleterm to the bottom section
        opts.bottom = opts.bottom or {}
        table.insert(opts.bottom, {
            ft = "toggleterm", -- Match toggleterm filetype
            size = { height = 0.3 }, -- Set height as a fraction of the total window
            filter = function(buf, win)
                -- Exclude floating terminals
                return not vim.api.nvim_win_get_config(win).relative
            end,
        })
    end,
},    
    
    {
        "folke/which-key.nvim", -- Keybinding helper
        enabled = true,
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>/",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        "akinsho/toggleterm.nvim", -- Terminal integration
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = 10, -- Height of the terminal
                open_mapping = [[<F12>]], -- Keybinding to toggle the terminal
                direction = "horizontal", -- Open terminal at the bottom
                shade_terminals = true, -- Dim the background of the terminal
                persist_size = true, -- Remember terminal size
            })

            -- Keybindings for terminal management
            vim.keymap.set("n", "<F12>", "<Cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
            vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
        end,
    },
}
