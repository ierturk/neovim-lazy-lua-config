-- Centralized key bindings

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General keymaps
map("n", "<leader>w", ":w<CR>", opts) -- Save file
map("n", "<leader>q", ":q<CR>", opts) -- Quit file
map("n", "<leader>h", ":nohlsearch<CR>", opts) -- Clear search highlight

-- Plugin-specific keymaps
-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

-- NvimTree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- LSP
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "K", vim.lsp.buf.hover, opts)

-- GitSigns
map("n", "<leader>gb", ":Gitsigns blame_line<CR>", opts)

-- Bufferline (Tab bar)
map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts) -- Go to the next buffer
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts) -- Go to the previous buffer
map("n", "<leader>bp", ":BufferLinePick<CR>", opts) -- Pick a buffer to switch to
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opts) -- Pick a buffer to close

-- LazyGit
map("n", "<leader>lg", ":LazyGit<CR>", opts) -- Open LazyGit


-- ToggleTerm
-- map("n", "<C-\tt>", ":ToggleTerm<CR>", opts) -- Toggle terminal
-- map("t", "<leader>tt", [[<C-\><C-n>:ToggleTerm<CR>]], opts) -- Toggle terminal in terminal modei
-- vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", { noremap = true, silent = true }) -- Toggle terminal
-- vim.keymap.set("t", "<C-t>", ":ToggleTerm<CR>", { noremap = true, silent = true }) -- Toggle terminal
