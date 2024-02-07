return {
    {
        "lewis6991/gitsigns.nvim",

        config = function()
            local gs = require('gitsigns')

            gs.setup({
                signs = {
                    add          = { text = '▊' },
                    change       = { text = '▊' },
                    delete       = { text = '_' },
                    topdelete    = { text = '‾' },
                    changedelete = { text = '~' },
                    untracked    = { text = '╏' },
                },
            })

            vim.keymap.set('n', '<leader>gs', gs.stage_hunk)
            vim.keymap.set('n', '<leader>gr', gs.reset_hunk)
            vim.keymap.set('v', '<leader>gs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
            vim.keymap.set('v', '<leader>gr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
            vim.keymap.set('n', '<leader>gS', gs.stage_buffer)
            vim.keymap.set('n', '<leader>gu', gs.undo_stage_hunk)
            vim.keymap.set('n', '<leader>gR', gs.reset_buffer)
        end
    }
}
