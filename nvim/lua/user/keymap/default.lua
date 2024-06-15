local silent = { silent = true }

vim.keymap.set("n", "<c-z>", ":u<CR>")
vim.keymap.set("n", "<c-s>", ":w<CR>")
vim.keymap.set("n", "<c-j>", ":Neotree toggle<CR>", silent)
vim.keymap.set("n", "<c-f>", ":Neotree focus<CR>", silent)
vim.keymap.set("n", "<s-f>", ":Neotree float<CR>", silent)
