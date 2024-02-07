return {
    {
        "nvim-telescope/telescope.nvim",

        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-p>", builtin.find_files, {})
            vim.keymap.set("n", "<C-g>", builtin.live_grep, {})
            vim.keymap.set("n", "<C-l>", builtin.buffers, {})
            vim.keymap.set("n", "<C-h>", builtin.help_tags, {})

            require("telescope").setup({
                pickers = {
                    find_files = {
                        hidden = true,
                        mappings = {
                            i = {
                                ["<Esc>"] = "close",
                            },
                        },
                    },
                    live_grep  = {
                        mappings = {
                            i = {
                                ["<Esc>"] = "close",
                            },
                        },
                    },
                },
                defaults = {
                    vimgrep_arguments = {
                        "rg",
                        "--hidden",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case"
                    }
                }
            })
        end,
    }
}
