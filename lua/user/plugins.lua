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
