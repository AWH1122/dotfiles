return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    opts = {
        flavour = "mocha",
        integrations = {
            lualine = true,
        },
        dim_inactive = {
            enabled = true,
        },
        lsp_styles = {
            underlines = {
                errors = { "undercurl" },
            }
        }
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin-nvim")
    end,

}
