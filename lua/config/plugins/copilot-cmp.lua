return {
    "zbirenbaum/copilot-cmp", -- Copilot integration with nvim-cmp
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
        require("copilot_cmp").setup()
    end,
}
