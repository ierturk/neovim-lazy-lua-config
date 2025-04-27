return {
  "kevinhwang91/nvim-bqf",
  ft = "qf", -- Load only when quickfix is opened
  config = function()
    require("bqf").setup({
      auto_enable = true, -- Automatically enable bqf for quickfix
      preview = {
        auto_preview = true, -- Automatically show preview for the selected item
        border = "rounded", -- Border style for the preview window
        win_height = 15, -- Height of the preview window
        win_vheight = 15, -- Height of the preview window for vertical splits
        delay_syntax = 50, -- Delay in milliseconds for syntax highlighting
        show_title = true, -- Show the title of the preview window
      },
      func_map = {
        open = "<CR>", -- Open the selected item
        drop = "o", -- Open in a new split
        split = "s", -- Open in a horizontal split
        vsplit = "v", -- Open in a vertical split
        tab = "t", -- Open in a new tab
        prevfile = "K", -- Go to the previous file
        nextfile = "J", -- Go to the next file
      },
      filter = {
        fzf = {
          action_for = { ["ctrl-s"] = "split", ["ctrl-v"] = "vsplit", ["ctrl-t"] = "tab" },
          extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
        },
      },
    })
  end,
}
