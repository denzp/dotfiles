return {
    {
        "neovim/nvim-lspconfig",

        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup {
                automatic_installation = true,
            }

            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- require("lspconfig").yamlls.setup {
            --     capabilities,
            -- }
            require("lspconfig").lua_ls.setup {
                capabilities,
            }
            require("lspconfig").html.setup {
                capabilities,
            }
            require("lspconfig").cssls.setup {
                capabilities,
            }
            require("lspconfig").jsonls.setup {
                capabilities,
            }
            require("lspconfig").biome.setup {
                capabilities,
            }
            require("lspconfig").helm_ls.setup {
                capabilities,

                settings = {
                    ['helm-ls'] = {
                        logLevel = "debug",
                        yamlls = {
                            path = "yaml-language-server",
                        }
                    }
                }
            }
            require("lspconfig").rust_analyzer.setup {
                capabilities,
                settings = {
                    ['rust-analyzer'] = {
                        checkOnSave = false,
                        diagnostics = {
                            enable = true,
                        }
                    },
                },
            }
        end,
    },
    {
        "hrsh7th/nvim-cmp",

        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                completion = {
                    completeopt = 'menu,menuone,noinsert'
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                sources = {
                    { name = 'path' },
                    { name = 'nvim_lsp', keyword_length = 1 },
                    { name = 'buffer',   keyword_length = 3 },
                    { name = 'luasnip',  keyword_length = 2 },
                },
                window = {
                    documentation = cmp.config.window.bordered()
                },
                formatting = {
                    fields = { 'menu', 'abbr', 'kind' },
                    format = function(entry, item)
                        local menu_icon = {
                            nvim_lsp = 'λ',
                            luasnip = '⋗',
                            buffer = 'Ω',
                            path = '🖫',
                        }

                        item.menu = menu_icon[entry.source.name]
                        return item
                    end,
                },
                mapping = {
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-up>'] = cmp.mapping.select_prev_item(),
                    ['<C-down>'] = cmp.mapping.select_next_item(),
                    ['<C-PageUp>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-PageDown>'] = cmp.mapping.scroll_docs(4),
                    ["<CR>"] = cmp.mapping({
                        i = function(fallback)
                            if cmp.visible() then
                                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                            else
                                fallback()
                            end
                        end,
                        s = cmp.mapping.confirm({ select = true }),
                        c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                    }),
                }
            })
        end,
    },
    {
        'saecki/crates.nvim',

        event = { "BufRead Cargo.toml" },
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    },
    {
        'simrat39/rust-tools.nvim',

        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local rt = require("rust-tools")

            rt.setup({
                server = {
                    on_attach = function(_, bufnr)
                        -- Hover actions
                        vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                        -- Code action groups
                        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                    end,
                },
            })
        end,
    },
    {
        'towolf/vim-helm',
        lazy = false,
    },
}
