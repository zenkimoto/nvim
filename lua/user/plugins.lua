local fn = vim.fn

-- Automatically install packer
-- on initial load if packer is not installed
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua filei
-- Run "PackerSync" every time the file plugins.lua is updated...
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
-- Return if packer module is unable to be loaded...
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window instead of default behavior
-- Default behavior: Packer window to the right
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim"     -- Have packer manage itself
  use "nvim-lua/popup.nvim"        -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"      -- Useful lua functions used ny lots of plugins
--  use "LunarVim/Colorschemes"
-- use "folke/tokyonight.nvim"
  use "joshdick/onedark.vim" 

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
