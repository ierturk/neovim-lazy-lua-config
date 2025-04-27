return {
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
            cmd = { "clangd17" },
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
}
