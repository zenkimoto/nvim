local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end

hop.setup { 
  keys = 'etovxqpdygfblzhckisuran'
}

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Normal Mode --

keymap('n', '<leader><leader>w', ":HopWordAC<cr>", {})
keymap('n', '<space><space>w', ":HopWordAC<cr>", {})

keymap('n', '<leader><leader>b', ":HopWordBC<cr>", {})
keymap('n', '<space><space>b', ":HopWordBC<cr>", {})

keymap('n', '<leader><leader>f', ":HopChar1AC<cr>", {})
keymap('n', '<space><space>f', ":HopChar1AC<cr>", {})

keymap('n', '<leader><leader>F', ":HopChar1BC<cr>", {})
keymap('n', '<space><space>F', ":HopChar1BC<cr>", {})

keymap('n', '<leader><leader>h', ":HopChar2<cr>", {})
keymap('n', '<space><space>h', ":HopChar2<cr>", {})

keymap('n', '<leader><leader>l', ":HopLine<cr>", {})
keymap('n', '<space><space>l', ":HopLine<cr>", {})

