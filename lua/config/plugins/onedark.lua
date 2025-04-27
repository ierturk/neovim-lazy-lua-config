return {
    "navarasu/onedark.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
        require("onedark").setup({
            style = "warmer", -- Set the style to "warm"
        })
        require("onedark").load() -- Apply the color scheme
    end,
}
