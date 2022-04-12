local execute = vim.api.nvim_command
local packer = nil
-- check if packer is installed (~/.local/share/nvim/site/pack)
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local compile_path = install_path .. "/plugin/packer_compiled.lua"
local is_installed = vim.fn.empty(vim.fn.glob(install_path)) == 0

local function init()
  if not is_installed then
      if vim.fn.input("Install packer.nvim? (y for yes) ") == "y" then
          execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
          execute("packadd packer.nvim")
          print("Installed packer.nvim.")
          is_installed = 1
      end
  end

  if not is_installed then return end
  if packer == nil then
      packer = require('packer')
      packer.init({
          -- we don't want the compilation file in '~/.config/nvim'
          disable_commands = true,
          compile_path = compile_path,
      config = {
        max_jobs = 100,
      }
      })
  end

  local use = packer.use
  packer.reset()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Needed to load first
  use {'lewis6991/impatient.nvim', rocks = 'mpack'}
  use {'nathom/filetype.nvim'}
  use {'nvim-lua/plenary.nvim'}
  use {'kyazdani42/nvim-web-devicons'}
  use {'glepnir/dashboard-nvim', config = "require('plugins.dashboard')"}

  -- Themes
  use {'bluz71/vim-nightfly-guicolors'}
  use {'folke/tokyonight.nvim'}

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter',
      config = "require('plugins.treesitter')",
      run = ':TSUpdate'}
  use {'nvim-treesitter/nvim-treesitter-textobjects', after = {'nvim-treesitter'}}
  use {'RRethy/nvim-treesitter-textsubjects', after = {'nvim-treesitter'}}

  -- Telescope
  use {'nvim-telescope/telescope.nvim',
      config = "require('plugins.telescope')",
      requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-fzf-native.nvim'}
      }
    }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {'cljoly/telescope-repo.nvim'}

  -- LSP Base
  use {'neovim/nvim-lspconfig'}

  -- LSP Cmp
  use {'hrsh7th/nvim-cmp', module = 'cmp', event = 'InsertEnter', config = "require('plugins.cmp')"}
  use {'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp', after = 'cmp-nvim-lua'}
  use {'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp'}
  use {'hrsh7th/cmp-path', after = 'cmp-buffer'}
  use {'hrsh7th/cmp-calc', after = 'cmp-path'}
  use {'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp', after = 'cmp-calc', config = "require('plugins.tabnine')"}
  use {'David-Kunz/cmp-npm', after = 'cmp-tabnine', requires = 'nvim-lua/plenary.nvim', config = "require('plugins.cmp-npm')"}
  use {'saadparwaiz1/cmp_luasnip', after = 'cmp-npm'}
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use 'kristijanhusak/vim-dadbod-completion'
  use 'ray-x/cmp-treesitter'
  use 'hrsh7th/cmp-emoji'

  -- LSP Addons
  use {'williamboman/nvim-lsp-installer', module = 'nvim-lsp-installer', event = 'BufEnter', after = 'cmp-nvim-lsp', config = "require('lsp.installer')"}
  use {'stevearc/dressing.nvim', requires = 'MunifTanjim/nui.nvim', config = "require('plugins.dressing')"}
  use {'onsails/lspkind-nvim'}
  use {'folke/lsp-trouble.nvim', config = "require('plugins.trouble')"}
  use {'nvim-lua/popup.nvim'}
  use {'SmiteshP/nvim-gps', config = "require('plugins.gps')", after = 'nvim-treesitter'}
  use {'jose-elias-alvarez/nvim-lsp-ts-utils', after = {'nvim-treesitter'}}

  -- General
  use {'AndrewRadev/switch.vim'}
  use {'AndrewRadev/splitjoin.vim'}
  use {'numToStr/Comment.nvim', config = "require('plugins.comment')"}
  use {'akinsho/nvim-toggleterm.lua', config = "require('plugins.toggleterm')"}
  use {'tpope/vim-repeat'}
  use {'tpope/vim-speeddating'}
  use {'tpope/vim-surround'}
  use {'dhruvasagar/vim-table-mode'}
  use {'mg979/vim-visual-multi'}
  use {'junegunn/vim-easy-align'}
  use {'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter'}
  use {'nacro90/numb.nvim', config = "require('plugins.numb')"}
  use {'folke/todo-comments.nvim'}
  use {'folke/zen-mode.nvim', config = "require('plugins.zen')", disable = not EcoVim.plugins.zen.enabled}
  use {'folke/twilight.nvim', config = function() require("twilight").setup {} end, disable = not EcoVim.plugins.zen.enabled}
  use {'ggandor/lightspeed.nvim'}
  use {'folke/which-key.nvim', config = "require('plugins.which-key')", event = "BufWinEnter"}
  use {'ecosse3/galaxyline.nvim', after = 'nvim-gps', config = "require('plugins.galaxyline')"}
  use {'romgrk/barbar.nvim', config = "require('plugins.barbar')"}
  use {'antoinemadec/FixCursorHold.nvim'} -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  use {'rcarriga/nvim-notify'}
  use {'vuki656/package-info.nvim', disable = not EcoVim.plugins.package_info.enabled}
  use {'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' }
  }

  -- Snippets & Language & Syntax
  use {'windwp/nvim-autopairs', after = {'nvim-treesitter', 'nvim-cmp'}, config = "require('plugins.autopairs')"}
  use {'p00f/nvim-ts-rainbow', after = {'nvim-treesitter'}}
  use {'mattn/emmet-vim'}
  use {'potatoesmaster/i3-vim-syntax'}
  use {'lukas-reineke/indent-blankline.nvim', config = "require('plugins.indent')"}
  use {'norcalli/nvim-colorizer.lua', config = "require('plugins.colorizer')"}
  use {'L3MON4D3/LuaSnip', requires = {'rafamadriz/friendly-snippets'}, after = 'cmp_luasnip'}

  -- Nvim Tree / Rooter
  use {'kyazdani42/nvim-tree.lua', config = "require('plugins.tree')"}
  use {'airblade/vim-rooter'}

  -- Debug
  -- TODO: Configure dap
  -- use {'rcarriga/nvim-dap-ui', requires = {"mfussenegger/nvim-dap"}}
  -- use {'mfussenegger/nvim-dap', config = "require('plugins.dap')"}

  -- Git
  use {'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = "require('plugins.gitsigns')",
    event = "BufRead"
  }
  use {'sindrets/diffview.nvim'}

  --from old
    use {'andweeb/presence.nvim', config = "require('plugins.discord')"}

    --tpope backend
    use "tpope/vim-rails"
    use "tpope/vim-endwise"
    use "tpope/vim-rvm"
    use "tpope/vim-dadbod"
    use "tpope/vim-jdaddy"
    use "tpope/vim-rake"
    use "tpope/vim-bundler"

    --test suite
    use "vim-test/vim-test"
    use { "rcarriga/vim-ultest", requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }

    --harpoon
    use "ThePrimeagen/harpoon"

  --cheat
    use 'dbeniamine/cheat.sh-vim'

    --formatter
    use {'prettier/vim-prettier', run = 'yarn install' }
    use 'sbdchd/neoformat'

    --git PR
    use {'pwntester/octo.nvim', config=function()
      require"octo".setup()
    end}
--no distractions mode
  use "junegunn/goyo.vim"

  --scroll
  use 'karb94/neoscroll.nvim'

  --git fugitive
  use "tpope/vim-fugitive"

  --ruby
  -- --neoscroll
  -- use {'karb94/neoscroll.nvim', config=function() require("neoscroll").setup() end}
  --gruvbox
  use "luisiacc/gruvbox-baby"
  use "lukas-reineke/cmp-rg"
  --formatters null ls
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  --find and replace
  use {'ray-x/sad.nvim', config = "require('plugins.sad')"}
  use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}

  use 'SirVer/ultisnips'
  use 'mlaursen/vim-react-snippets'
  use {'quangnguyen30192/cmp-nvim-ultisnips', config = "require('plugins.ultisnips')"}
  use {'rktjmp/lush.nvim'}
  use {'JLighter/aura.nvim'}
  use {'gilgigilgil/anderson.vim'}
  use {'drewtempelmeyer/palenight.vim'}
  use {'kristijanhusak/vim-dadbod-ui'}
--   use {'nanotee/sqls.nvim', config=function()
--     require('lspconfig').sqls.setup{
--     on_attach = function(client, bufnr)
--         require('sqls').on_attach(client, bufnr)
--     end
-- }end}
  use 'nanotee/sqls.nvim'
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})

return plugins
