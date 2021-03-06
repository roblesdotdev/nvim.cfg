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
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'nvim-telescope/telescope-fzf-writer.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
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
    config = function() 
      if pcall(require, 'nvim-treesitter') then
        require'my.treesitter'
      end
    end
  }
  
  -- Illuminate
  use 'RRethy/vim-illuminate'

  -- Syntax
  use 'elzr/vim-json'
  use 'cespare/vim-toml'
  use {
    'plasticboy/vim-markdown',
    config = function() 
      vim.api.nvim_exec([[
        let g:vim_markdown_folding_disabled = 1
        let g:vim_markdown_conceal = 1
        let g:tex_conceal = ''
        let g:vim_markdown_math = 1
      ]], false)
    end
  }

  -- Languages
  -- TODO: check if they are the best
  use 'jelera/vim-javascript-syntax'
  use 'othree/javascript-libraries-syntax.vim'
  use 'leafgarland/typescript-vim'
  use 'peitalin/vim-jsx-typescript'
  use 'elixir-editors/vim-elixir'
  use 'dart-lang/dart-vim-plugin'
  use 'jparise/vim-graphql'
  use 'othree/xml.vim'

  -- Colors 
  use 'norcalli/nvim-colorizer.lua'

  -- Comments
  use {
    'terrortylor/nvim-comment',
    config = function() 
      if pcall(require, 'nvim_comment') then
        require('nvim_comment').setup()
      end
    end
  }

  -- LSP
  use 'glepnir/lspsaga.nvim'
  use 'ray-x/lsp_signature.nvim'
  use 'onsails/lspkind-nvim'
  use 'nvim-lua/lsp-status.nvim'
  use { 
    'neovim/nvim-lspconfig',
    config = function()
      if pcall(require, 'lspconfig') then
        require('my.lsp')
      end
    end
  }

  -- Testing Express line
  use {
    'tjdevries/express_line.nvim',
    config = function () 
      if pcall(require, 'el') then
        require('my.status')
      end
    end
  }

  -- Completion
  use {
    'hrsh7th/nvim-compe',
    config = function()
      if pcall(require, 'compe') then
        require'my.completion'
      end
    end
  }

  -- Prettier
  use { 
    'prettier/vim-prettier', 
    run = 'npm i',
    config = function()
      vim.cmd([[
        let g:prettier#quickfix_enabled = 0
        let g:prettier#quickfix_auto_focus = 0
      ]])
    end
  }

  -- TREE
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      vim.g["nvim_tree_gitignore"] = 1
      vim.g["nvim_tree_quit_on_open"] = 1
      vim.cmd [[nnoremap <A-1> :NvimTreeToggle<CR>]]
    end
  }

  -- Flutter Tools
  use 'akinsho/flutter-tools.nvim'

  -- Snippets
  -- use {
  --   'L3MON4D3/LuaSnip',
  --   config = function()
  --     if pcall(require, 'luasnip') then
  --       require ('my.snippets')
  --     end
  --   end
  -- }
  use {
    'hrsh7th/vim-vsnip',
    requires = {
      'hrsh7th/vim-vsnip-integ'
    },
    config = function()
      local snipdir = vim.fn.expand('~/.config/nvim/snips')
      vim.g['vsnip_snippet_dir'] = snipdir
      vim.cmd[[ imap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>' ]]
    end
  }

  -- Testing tabs
  use {
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() 
      if pcall(require, 'bufferline') then
        require('bufferline').setup {
          options = {
            diagnostics = 'nvim_lsp',
            show_buffer_close_icons = false,
            show_close_icon = false,
            sort_by = 'directory',
          }
        }
      end
    end
  }
end)
