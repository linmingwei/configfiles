-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- clear highlight search
-- 步骤 1: 完整地删除 LazyVim 为 <Esc> 设置的默认绑定
-- 因为它同时为 i, n, s 三种模式设置了，所以我们也需要为这三种模式一起删除
-- vim.keymap.del({ "i", "n", "s" }, "<esc>")

-- 步骤 2: 创建您想要的 "空格 + 回车" 来清除高亮的新绑定
vim.keymap.set("n", "<Space><CR>", "<cmd>nohlsearch<CR>", {
  desc = "Clear Search Highlight",
  noremap = true,
  silent = true,
})
