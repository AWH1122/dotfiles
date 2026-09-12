return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "catppuccin/nvim",
    },

    opts = {
        options = {
            global_status = true,
            theme = require("catppuccin.utils.lualine")(),
            component_separators = '|',
            section_separators = '',
        },
    },
}
