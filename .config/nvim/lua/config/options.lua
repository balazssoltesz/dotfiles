-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 30 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 30
vim.o.foldenable = true
vim.o.autochdir = false

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
