return {
    "zbirenbaum/copilot.lua", -- Enhanced Copilot integration
    config = function()
        require("copilot").setup({
            suggestion = { enabled = true },
            panel = { enabled = true },
        })
    end,
}
