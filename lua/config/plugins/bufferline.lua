return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        offsets = {
          {
            filetype = "neo-tree", -- Offset bufferline for Neo-tree
            text = "File Explorer", -- Text to display in the offset
            text_align = "center", -- Align the text in the center
            separator = true,      -- Show a separator between Neo-tree and bufferline
          },
        },
        separator_style = "slant", -- Style of separators between buffers
        diagnostics = "nvim_lsp", -- Show LSP diagnostics in the bufferline
        show_buffer_close_icons = true,
        show_close_icon = false,
        always_show_bufferline = true,
      },
    })
  end,
}
