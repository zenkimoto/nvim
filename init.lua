if (not vim.g.vscode)
then
  require "user.options"
  require "user.keymaps"
  require "user.plugins"
  require "user.colorscheme"
  require "user.cmp"
  require "user.lsp"
  require "user.treesitter"
  require "user.nvim-tree"
  require "user.autopairs"
  require "user.comment"
  require "user.toggleterm"
  require "user.gitsigns"
  require "user.bufferline"
  require "user.lualine"
  require "user.neoscroll"
  require "user.hop"
else
  require "user.plugins-vscode"
end
