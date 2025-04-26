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
        "github/copilot.vim", -- GitHub Copilot
        config = function()
            vim.g.copilot_no_tab_map = true -- Disable default <Tab> mapping
            vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
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
        "akinsho/toggleterm.nvim", -- Terminal integration
        enabled = true,
        priority = 1000,
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = 20, -- Default terminal size
                open_mapping = [[<C-\>]], -- Keybinding to toggle terminal
                hide_numbers = true, -- Hide line numbers in terminal
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                persist_size = true,
                direction = "float", -- Options: 'vertical', 'horizontal', 'tab', 'float'
                float_opts = {
                    border = "curved", -- Border style for floating terminal
                    winblend = 3,
                },
            })
        end,
    },
    {
        "christoomey/vim-tmux-navigator", -- Seamless navigation between Tmux and Neovim
        enabled = false,
        lazy = false, -- Load immediately
    },
    {
        "folke/edgy.nvim", -- Edge window manager
        enabled = false,
        optional = true,
        opts = function(_, opts)
            opts.right = opts.right or {}
            table.insert(opts.right, {
                ft = "copilot-chat",
                title = "Copilot Chat",
                size = { width = 50 },
            })
        end,
    },
    {
        -- Which-key Extension
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
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
}
