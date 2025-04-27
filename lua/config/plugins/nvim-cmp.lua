 return {
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
                { name = "nvim_lsp_signature_help" }, -- LSP signature help
                { name = "CopilotChat" }, -- CopilotChat source
                { name = "cmdline" }, -- Command-line source
            }),
        })
    end,
}
