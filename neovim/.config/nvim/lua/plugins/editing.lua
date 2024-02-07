return {
    {
        "echasnovski/mini.trailspace",

        config = function()
            require('mini.trailspace').setup()

            vim.keymap.set("n", "<leader>ts", [[:lua MiniTrailspace.trim() <CR>]], { silent = true })
        end,
    },
    {
        "numToStr/Comment.nvim",

        config = function()
            require('Comment').setup({
                ignore = '^$',
                extra = nil,
                toggler = {
                    line = '<leader>c<leader>',
                },
                opleader = {
                    line = '<leader>c<leader>',
                },
                mappings = {
                    extra = false,
                },
            })
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",

        main = "ibl",
        lazy = false,
        config = function()
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }

            local hooks = require "ibl.hooks"

            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#D05C65" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#D5B06B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#519FDF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#C18A56" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#88B369" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#B668CD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#46A6B2" })
            end)

            vim.opt.list = true
            vim.opt.listchars = {
                tab = "→ ",
                multispace = "·",
                lead = "·",
                trail = "·",
                nbsp = "·",
            }

            require('ibl').setup({
                indent = { highlight = highlight },
                scope = { enabled = true },
            })
        end,
    },
}
