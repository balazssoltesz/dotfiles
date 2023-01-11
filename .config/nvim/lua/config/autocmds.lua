-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter", "FileType" }, {
  pattern = { "lua" },
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end,
})

vim.cmd([[
  if system('uname -r') =~ "microsoft"
    augroup Yank
    autocmd!
    autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
    augroup END
  endif
]])

-- keep folds on save
vim.cmd([[
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END
]])
