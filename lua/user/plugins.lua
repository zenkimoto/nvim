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

  -- Bufferline
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  -- Color Schemes
  use "folke/tokyonight.nvim"
  use "joshdick/onedark.vim"
  use 'Mofiqul/dracula.nvim'

  -- Lualine
  use 'nvim-lualine/lualine.nvim'

  -- Comments
  use "numToStr/Comment.nvim" -- Easily comment stuff

  -- Autopairs
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter

  -- cmp Plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Context aware comments (requires treesitter)
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- nvim-tree
--  use 'kyazdani42/nvim-web-devicons'
--  use 'kyazdani42/nvim-tree.lua'

  -- nvim-neo-tree
  use { "nvim-neo-tree/neo-tree.nvim", 
    branch = "v1.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim" 
    },
  }  

  -- GitSigns
  use "lewis6991/gitsigns.nvim"

  -- Toggleterm
  use "akinsho/toggleterm.nvim"

  -- neoscroll
  use 'karb94/neoscroll.nvim'

  -- indent-blankline
  use "lukas-reineke/indent-blankline.nvim"

  -- Hop
  use {
    'phaazon/hop.nvim',
    branch = 'v1.2'
  }

  use { "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons"
  }

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use {
    "ur4ltz/surround.nvim",
    config = function()
      require"surround".setup {mappings_style = "surround"}
    end
  }


  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require"colorizer".setup()
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
