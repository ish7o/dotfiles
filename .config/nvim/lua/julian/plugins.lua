vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)

	use "wbthomason/packer.nvim"

	use {
		  'nvim-telescope/telescope.nvim', tag = '0.1.4',
		  requires = { {'nvim-lua/plenary.nvim'} }
	}

    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-jdtls'

	use({
	      "folke/trouble.nvim",
	      config = function()
		  require("trouble").setup {
		      icons = false,
		  }
	      end
	})


    -- For HackClub
    -- use "wakatime/vim-wakatime"

    use "othree/html5.vim"
    use "pangloss/vim-javascript"
    use "evanleck/vim-svelte"
    use "norcalli/nvim-colorizer.lua"

    use "psf/black"

    use "mattn/emmet-vim"

	use "nvim-lua/plenary.nvim"
	use "BurntSushi/ripgrep"

    -- use 'mfussenegger/nvim-dap'

	use({"nvim-treesitter/nvim-treesitter", ":TSUpdate"})
	use "mbbill/undotree"

    use {
        'williamboman/mason.nvim',
        config = function()
          require('mason').setup()
        end
      }

    use {
        'williamboman/mason-lspconfig.nvim',
        config = function()
          require('mason-lspconfig').setup({
            ensure_installed = {
              "pyright", "gopls", "html", "lua_ls", "tsserver",
              "rust-analyzer", "jdtls", "intelephense",
            },
          })

          local lspconfig = require('lspconfig')
          require('mason-lspconfig').setup_handlers({
              function (server_name)
                  if server_name ~= "jdtls" then
                      lspconfig[server_name].setup {
                          flags = { debounce_text_changes = 80 },
                          on_attach = require('java').on_attach,
                      }
                  end
              end,
          })
      end
      }

      use "L3MON4D3/LuaSnip"

      use "hrsh7th/vim-vsnip-integ"

      use {
        'neovim/nvim-lspconfig',
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
        },
      }

	-- use 'jose-elias-alvarez/null-ls.nvim'
	use 'MunifTanjim/prettier.nvim'

	use "tpope/vim-fugitive"


	-- use "rust-lang/rust.vim"
    use "simrat39/rust-tools.nvim"

    -- use "mfussenegger/nvim-jdtls"

	use "tpope/vim-commentary"
	use 'm4xshen/autoclose.nvim'

	-- use "ThePrimeagen/vim-be-good"

	use {
	  "folke/which-key.nvim",
	  config = function()
	    vim.o.timeout = true
	    vim.o.timeoutlen = 300
	    require("which-key").setup {
	    }
	  end
	}

	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	use "jiriks74/presence.nvim"


-- 	use {
-- 	    'tiagovla/tokyodark.nvim',
-- 	    config = function()
-- 		require('tokyodark').setup {
-- 		}
-- 	    end
-- 	}
	use "olimorris/onedarkpro.nvim"
	use({
		  'rose-pine/neovim',
		  as = 'rose-pine',
       })
end)
