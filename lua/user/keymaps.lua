local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
--keymap("", "<Space>", "<Nop>", opts)
--vim.g.mapleader = "\x1b"
--vim.g.maplocalleader = "\x1b"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal Mode --

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Open up netrw
--keymap("n", "<leader>e", ":Lex 20<cr>", opts)

-- Remap Shift-J (Annoying)
keymap("n", "<leader>j", "<S-j>", opts)
keymap("n", "<space>j", "<S-j>", opts)

-- Remap Shift-J and Shift-K
keymap("n", "<S-j>", "<C-d>", opts)
keymap("n", "<S-k>", "<C-u>", opts)

-- Resize with windows arrows
keymap("n", "<space><Up>", ":resize +2<CR>", opts)
keymap("n", "<space><Down>", ":resize -2<CR>", opts)
keymap("n", "<space><Right>", ":vertical resize -2<CR>", opts)
keymap("n", "<space><Left>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Delete buffers
keymap("n", "<leader>c", ":Bdelete<CR>", opts)
keymap("n", "<space>c", ":Bdelete<CR>", opts)
keymap("n", "<M-c>", ":Bdelete<CR>", opts)

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
--keymap("x", "<S-j>", ":move '>+1<CR>gv-gv", opts)
--keymap("x", "<S-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<space>ff", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>gr", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<space>gr", "<cmd>Telescope live_grep<cr>", opts)

-- neo-tree
keymap("n", "<leader>e", ":NeoTreeRevealInSplitToggle<cr>", opts)
keymap("n", "<space>e", ":NeoTreeRevealInSplitToggle<cr>", opts)

-- Trouble
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
