-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.keymap.set("n", "<leader>rr", ":GoRun<CR>", { desc = "Run Go", buffer = true })
    vim.keymap.set("n", "<leader>rs", ":GoStop<CR>", { desc = "Stop Go", buffer = true })
    vim.keymap.set("n", "<leader>rb", ":GoBuild<CR>", { desc = "Build Go", buffer = true })
    vim.keymap.set("n", "<leader>rt", ":GoTest<CR>", { desc = "Test Go", buffer = true })
    vim.keymap.set("n", "<leader>rc", ":GoCoverage<CR>", { desc = "Go Coverage", buffer = true })
  end,
})