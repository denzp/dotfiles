return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},

        config = function()
            require("tokyonight").setup()
            vim.cmd "colorscheme tokyonight-night"
        end,
    },
    {
        "bluz71/vim-nightfly-colors",
        name = "nightfly",
        lazy = false,
        priority = 1000,

        config = function()
            -- vim.cmd "colorscheme nightfly"
        end,
    }
}
