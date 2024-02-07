return {
    {
        "nvim-lualine/lualine.nvim",

        config = function()
            require("lualine").setup {
                options = {
                    icons_enabled = true,
                    component_separators = "",
                    section_separators = ""
                },
                sections = {
                    lualine_a = { "mode", "tab" },
                    lualine_c = {},
                    lualine_b = {
                        {
                            "buffers",
                            show_filename_only = true,          -- Shows shortened relative path when set to false.
                            hide_filename_extension = false,    -- Hide filename extension when set to true.
                            show_modified_status = true,        -- Shows indicator when the buffer is modified.

                            max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
                            use_mode_colors = true,
                            buffers_color = {
                                inactive = "lualine_c_inactive", -- Color for active buffer.
                                active = "lualine_a_inactive",   -- Color for inactive buffer.
                            },
                            symbols = {
                                modified = " ●", -- Text to show when the buffer is modified
                                alternate_file = "", -- Text to show to identify the alternate file
                                directory = "", -- Text to show when the buffer is a directory
                            },
                        },
                    },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "branch", "diff", "diagnostics" },
                    lualine_z = { "progress", "location" },
                },
            }
        end,
    }
}
