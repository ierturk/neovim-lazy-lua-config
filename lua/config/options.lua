-- Neovim options configuration

local opt = vim.opt

-- General settings
opt.number = true          -- Show line numbers
opt.relativenumber = true  -- Show relative line numbers
opt.wrap = false           -- Disable line wrapping
opt.scrolloff = 8          -- Keep 8 lines visible when scrolling
opt.sidescrolloff = 8      -- Keep 8 columns visible when scrolling horizontally

-- Tabs and indentation
opt.tabstop = 4            -- Number of spaces for a tab
opt.shiftwidth = 4         -- Number of spaces for autoindent
opt.expandtab = true       -- Convert tabs to spaces
opt.smartindent = true     -- Enable smart indentation

-- Search settings
opt.ignorecase = true      -- Ignore case in search patterns
opt.smartcase = true       -- Override ignorecase if search contains uppercase
opt.incsearch = true       -- Show search matches as you type
opt.hlsearch = false       -- Disable search highlight

-- Appearance
opt.termguicolors = true   -- Enable 24-bit RGB colors
opt.cursorline = true      -- Highlight the current line

-- Performance
opt.updatetime = 300       -- Faster completion (default is 4000ms)
opt.timeoutlen = 500       -- Time to wait for a mapped sequence (ms)

-- Splits
opt.splitright = true      -- Open vertical splits to the right
opt.splitbelow = true      -- Open horizontal splits below

-- Clipboard
-- opt.clipboard = "unnamedplus" -- Use system clipboard

-- Autocompletion settings
opt.completeopt = { "menu", "menuone", "noselect", "popup" } -- Required for CopilotChat.nvim

vim.g.clipboard = 'osc52' -- Use the system clipboard for copy/paste
