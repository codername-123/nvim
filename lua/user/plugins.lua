-- automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen nvim")
  vim.cmd [[packadd packer.nvim]]
end


local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end
-- Autocommand to run PackerSync when plugins.lua file is saved
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("packer_user_config", {clear = true}),
  pattern = "plugins.lua",
  command = [[ source <afile> | PackerSync]],
})

return packer.startup({function(use)
  -- Packer
  use "wbthomason/packer.nvim"

  -- Lua plugin development
  use "nvim-lua/plenary.nvim" 
  use "nvim-lua/popup.nvim"

  -- Colorschemes
  use "folke/tokyonight.nvim"
  
  -- Icons
  use "kyazdani42/nvim-web-devicons"

  -- File Explorer
  use "kyazdani42/nvim-tree.lua"

  -- Treesitter
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"
  use "p00f/nvim-ts-rainbow"
  use "lukas-reineke/indent-blankline.nvim"

  -- Comments
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use "numToStr/Comment.nvim"
  use "folke/todo-comments.nvim"

  -- Completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  use "onsails/lspkind-nvim"
  
  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
 
  -- Lsp 
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "b0o/SchemaStore.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "tami5/lspsaga.nvim"


  if packer_bootstrap then
    require('packer').sync()
  end 
end,

config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
      end
    }
  }
})
