vim.cmd([[packadd packer.nvim]])
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require("packer").startup(function(use)
  local local_use = function(first, second, opts)
    opts = opts or {}

    local plug_path, home
    if second == nil then
      plug_path = first
      home = "adalessa"
    else
      plug_path = second
      home = first
    end

    if vim.fn.isdirectory(vim.fn.expand("~/plugins/" .. plug_path)) == 1 then
      opts[1] = "~/plugins/" .. plug_path
    else
      opts[1] = string.format("%s/%s", home, plug_path)
    end

    use(opts)
  end

  use("wbthomason/packer.nvim")
  use("lewis6991/impatient.nvim")

  use({
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "nvim-treesitter/playground",
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  })

  -- optional
  use({ "junegunn/fzf.vim" })
  use({
    "junegunn/fzf",
    run = function()
      vim.fn["fzf#install"]()
    end,
  })

  use({
    "ThePrimeagen/harpoon",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
    },
  })

  use "windwp/nvim-projectconfig"

  -- Completion
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-git",
      "hrsh7th/cmp-emoji",
      "rcarriga/cmp-dap",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind-nvim",
      "L3MON4D3/LuaSnip",
      "windwp/nvim-autopairs",
      -- For vsnip users.
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
      },
  })

  use "rafamadriz/friendly-snippets"
  -- LSP
  use({
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "jose-elias-alvarez/null-ls.nvim",
  })

  -- Installation of LSP/Debuggers/Other
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  })

  use 'folke/lsp-colors.nvim'

  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-lua/popup.nvim" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
      { "kyazdani42/nvim-web-devicons" },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "nvim-telescope/telescope-dap.nvim" },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      { "xiyaowong/telescope-emoji.nvim" },
    },
  })
  use 'NvChad/nvim-colorizer.lua'

  use "stevearc/dressing.nvim"
  use "ziontee113/icon-picker.nvim"
  use("feline-nvim/feline.nvim")

  use({
    "mfussenegger/nvim-dap",
    requires = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "leoluz/nvim-dap-go",
    },
  })

  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  })

  use("vim-test/vim-test")
  use({
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go",
      "rouge8/neotest-rust",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-vim-test",
    },
  })

  use "j-hui/fidget.nvim"

  use("rcarriga/nvim-notify")

  use("EdenEast/nightfox.nvim")



  use({
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })

 use ("linty-org/key-menu.nvim")

  use({
    "kristijanhusak/vim-dadbod-ui",
    requires = {
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-completion",
      "tpope/vim-dotenv",
    },
  })
use "windwp/nvim-ts-autotag"
  use({
    "NTBBloodbath/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  use({ "vimwiki/vimwiki", opt = true, cmd = { "VimwikiIndex" } })

  use({ "hkupty/iron.nvim" })


  use({
    "anuvyklack/hydra.nvim",
    requires = { 
      "anuvyklack/keymap-layer.nvim", -- needed only for pink hydras
      "jbyuki/venn.nvim",
      "romgrk/barbar.nvim",
      "mrjones2014/smart-splits.nvim",
      'albertoCaroM/toggleSplitMaximize'
    },
  })


  use 'albertoCaroM/toggleSplitMaximize'
  use "jbyuki/venn.nvim"
  use({"xiyaowong/nvim-transparent"})
  use 'Maan2003/lsp_lines.nvim'

  use("tpope/vim-dotenv")
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround' -- Change surrounding arks
  use 'tpope/vim-repeat' -- extends . repeat, for example for make it work with vim-sneak
  use 'tpope/vim-sleuth'
  use 'tpope/vim-endwise' -- helps to end certain structures automatically. In Ruby, this means adding end after if, do, def and several other keywords. I

  use 'christoomey/vim-tmux-navigator'
  -- start screen
  use 'mhinz/vim-startify'
  use 'tweekmonster/startuptime.vim' -- benchmark startup
  use 'antoinemadec/FixCursorHold.nvim' -- Fix CursorHold Performance
  use "rafcamlet/nvim-luapad"
  -- use 'airblade/vim-gitgutter' -- show git gutters */
  -- use 'junegunn/gv.vim'

  use 'vim-utils/vim-man' -- man pages
  use 'mbbill/undotree' -- undo tree
  use 'terryma/vim-multiple-cursors' 
  use 'liuchengxu/vista.vim'
  use { 'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim' }
  use {
    "cuducos/yaml.nvim",
    ft = {"yaml"}, -- optional
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim" -- optional
    },
  }

  use 'MunifTanjim/nui.nvim'
  use 'tversteeg/registers.nvim'
  use 'folke/which-key.nvim'
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use "lukas-reineke/indent-blankline.nvim"
  use 'b3nj5m1n/kommentary'
  use 'gpanders/editorconfig.nvim'
  -- use 'editorconfig/editorconfig-vim'
  use 'habamax/vim-asciidoctor'
  -- use 'wellle/targets.vim'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    --tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use 'akinsho/toggleterm.nvim'

end
)
