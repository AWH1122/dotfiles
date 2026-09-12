vim.g.mapleader = " "
-- vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { silent = true })
-- vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { silent = true })
-- vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { silent = true })
-- vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", { silent = true })
-- vim.keymap.set("i", "<M-j>", "<Esc>:m .+1<CR>==gi", { silent = true })
-- vim.keymap.set("i", "<M-k>", "<Esc>:m .-2<CR>==gi", { silent = true })

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<C-s>", "<C-w>s")

vim.keymap.set("n", "<C-/>", "Vgc<Esc>", { remap = true })
vim.keymap.set("v", "<C-/>", "gc", { remap = true })
vim.keymap.set("i", "<C-/>", "<Esc>Vgc<Esc>gi", { remap = true })

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Select entire buffer text object

vim.keymap.set('o', 'ae', '<cmd>normal! ggVG<CR>', { desc = 'Select entire buffer' })
vim.keymap.set('x', 'ae', '<Esc>ggVG', { desc = 'Select entire buffer' })

-- 'inner entire' (ie) - mapped to the same behavior for muscle memory
vim.keymap.set('o', 'ie', '<cmd>normal! ggVG<CR>', { desc = 'Select entire buffer' })
vim.keymap.set('x', 'ie', '<Esc>ggVG', { desc = 'Select entire buffer' })
