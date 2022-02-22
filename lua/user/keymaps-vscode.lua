local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Normal Mode --

-- Remap Shift-J (Annoying)
keymap("n", "<leader>j", "<S-j>", opts)
keymap("n", "<space>j", "<S-j>", opts)

-- Remap Shift-J and Shift-K
keymap("n", "<S-j>", "<C-d>", opts)
keymap("n", "<S-k>", "<C-u>", opts)

-- Insert Mode --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Visual Mode --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<S-j>", ":m .+1<CR>==", opts)
keymap("v", "<S-k>", ":m .-2<CR>==", opts)

-- Paste
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
