local options = {
	number = true,
	numberwidth = 2,
	tabstop = 2,
	shiftwidth = 2,
	backup = false,
	clipboard = "unnamedplus",
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	mouse = "a",
	smartcase = true,
	smartindent = true,
	swapfile = false,
	termguicolors = true,
	timeoutlen = true,
	undofile = true,
	updatetime = 100,
  	timeoutlen = 500,
	writebackup = false,
	expandtab = true,
	laststatus = 3,
	scrolloff = 8,
	sidescrolloff = 8,
  	--completeopt = {"menuone", "noselect"},	
}

for k, v in pairs(options) do 
	vim.o[k] = v
end
