local keymap = vim.keymap.set
local opts = {silent = true}

keymap("n", "<space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- escape by pressing qq very fast 
keymap("i", "aa", "<esc>", opts)

-- indenting in visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- splitting window and moving between windows 
keymap("n", "ss", ":split<cr>", opts)
keymap("n", "sv", ":vsplit<cr>", opts)

keymap("n", "sh", "<c-w>h", opts)
keymap("n", "sl", "<c-w>l", opts)
keymap("n", "sj", "<c-w>j", opts)
keymap("n", "sk", "<c-w>k", opts)

-- tabs
keymap("n", "te", ":tabedit<cr>", opts)
keymap("n", "<C-p>", ":tabprev<cr>", opts)
keymap("n", "<C-n>", ":tabnext<cr>", opts)
keymap("n", "<C-c>", ":tabclose<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Visual Block Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- File Explorer
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)
