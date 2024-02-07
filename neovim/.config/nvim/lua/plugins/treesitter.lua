return {
    {
        "nvim-treesitter/nvim-treesitter",

        dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
        build = function()
            pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        end,
        config = function()
            require("nvim-treesitter.configs").setup({
                -- Add languages to be installed here that you want installed for treesitter
                ensure_installed = { "c", "cpp", "go", "lua", "python", "rust", "vimdoc", "vim" },

                highlight = { enable = true },
                indent = { enable = true, disable = { "python" } },
            })
        end,
    },
}
