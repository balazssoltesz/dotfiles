-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local opts = { silent = true }

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)
-- Better paste
keymap("v", "p", '"_dP', opts)

-- Press jk fast to enter
keymap("i", "jj", "<ESC>", opts)
keymap("i", "kk", "<ESC>", opts)

keymap("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", opts)
keymap("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", opts)
keymap("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", opts)
keymap("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", opts)
keymap("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", opts)
keymap("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNext<CR>", opts)
