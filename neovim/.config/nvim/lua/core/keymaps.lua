vim.keymap.set("n", "d", [["_d]], { silent = true })
vim.keymap.set("n", "D", [["_D]], { silent = true })
vim.keymap.set("v", "d", [["_d]], { silent = true })

vim.keymap.set("n", "c", [["_c]], { silent = true })
vim.keymap.set("n", "C", [["_C]], { silent = true })
vim.keymap.set("v", "c", [["_c]], { silent = true })

vim.keymap.set("n", "<leader>d", [[""d]], { silent = true })
vim.keymap.set("n", "<leader>D", [[""D]], { silent = true })
vim.keymap.set("v", "<leader>d", [[""d]], { silent = true })

vim.keymap.set("n", "<leader>c", [[""c]], { silent = true })
vim.keymap.set("n", "<leader>C", [[""C]], { silent = true })
vim.keymap.set("v", "<leader>c", [[""c]], { silent = true })

vim.keymap.set("n", "<leader>y", [["+y]], { silent = true })
vim.keymap.set("n", "<leader>p", [["+p]], { silent = true })
vim.keymap.set("n", "<leader>P", [["+P]], { silent = true })
vim.keymap.set("v", "<leader>y", [["+y]], { silent = true })
vim.keymap.set("v", "<leader>p", [["+p]], { silent = true })
vim.keymap.set("v", "<leader>P", [["+P]], { silent = true })

vim.keymap.set("n", "<Tab>", [[:bnext!<CR>]], { silent = true })
vim.keymap.set("n", "<S-Tab>", [[:bprevious!<CR>]], { silent = true })

vim.keymap.set("n", "<leader>h", ":%s/")

vim.keymap.set("n", "<leader>f",  ":lua vim.lsp.buf.format()<CR>", { silent = true })
vim.keymap.set("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", { silent = true })
