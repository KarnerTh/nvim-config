local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<Left>", "<C-w>h", opts)
keymap("n", "<Right>", "<C-w>l", opts)
keymap("n", "<Down>", "<C-w>j", opts)
keymap("n", "<Up>", "<C-w>k", opts)

-- Format keybinding like intellij
keymap("n", "<C-A-l>", ":Format<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- keep yanked value after paste
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- center screen when navigating
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
