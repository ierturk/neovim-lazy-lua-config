-- LSP and syntax plugins

return {
    {
        "nvim-treesitter/nvim-treesitter", -- Syntax highlighting
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                highlight = { enable = true },
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp", -- Autocompletion plugin
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
            "hrsh7th/cmp-buffer", -- Buffer source for nvim-cmp
            "hrsh7th/cmp-path", -- Path source for nvim-cmp
            "hrsh7th/cmp-cmdline", -- Command-line source for nvim-cmp
            "zbirenbaum/copilot-cmp", -- Copilot source for nvim-cmp
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body) -- Replace with your snippet engine if needed
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                }),
                sources = cmp.config.sources({
                    { name = "copilot" }, -- Copilot suggestions
                    { name = "nvim_lsp" }, -- LSP suggestions
                    { name = "buffer" }, -- Buffer suggestions
                    { name = "path" }, -- Path suggestions
                }),
            })
        end,
    },
    {
        "neovim/nvim-lspconfig", -- LSP configurations
        enabled = enabled,
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Python language server
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })

            -- C++ language server
            lspconfig.clangd.setup({
                cmd = { "clangd" },
                filetypes = { "c", "cpp", "objc", "objcpp" },
                root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
                capabilities = capabilities,
            })

            -- Rust language server
            lspconfig.rust_analyzer.setup({
                cmd = { "rust-analyzer" },
                filetypes = { "rust" },
                root_dir = lspconfig.util.root_pattern("Cargo.toml", ".git"),
                capabilities = capabilities,
                settings = {
                    ["rust-analyzer"] = {
                        cargo = { allFeatures = true },
                        checkOnSave = { command = "clippy" },
                    },
                },
            })
        end,
    },
}
