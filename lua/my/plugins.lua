-- Only require if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function() 
  use 'wbthomason/packer.nvim'

  -- Testing colorscheme
  use { 
    'Julpikar/night-owl.nvim',
    config = function()
      if pcall(require, 'night-owl') then
        require'my.theme'
      end
    end
  }

	  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      'nvim-telescope/telescope-fzf-writer.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
    config = function()
      if pcall(require, 'telescope') then
        require'my.telescope'
      end
    end
  }

  -- Treesitter
  use 'p00f/nvim-ts-rainbow'
  use 'nvim-treesitter/playground'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() 
      if pcall(require, 'nvim-treesitter') then
        require'my.treesitter'
      end
    end
  }

end)
