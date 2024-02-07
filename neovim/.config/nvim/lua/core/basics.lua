vim.opt.number = true
vim.opt.encoding = "UTF-8"
vim.opt.updatetime = 100

vim.opt.hlsearch = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.termguicolors = true
vim.cmd.syntax = "on"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "latex", "tex", "md", "markdown" },
    callback = function()
        vim.opt.spell = true
        vim.opt.wrap = true
        vim.opt.linebreak = true
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "helm" },
    callback = function()
        local clients = vim.lsp.get_active_clients()
        for client_id, client in pairs(clients) do
            if client.name == "yamlls" then
                vim.lsp.buf_detach_client(0, client_id)
            end
        end
    end,
})

vim.api.nvim_create_autocmd("BufRead", {
    pattern = { "*/templates/*.yml" },
    callback = function()
        vim.bo.ft = "helm"
    end,
})
