return {
    'saghen/blink.cmp',
    dependencies = {
        'saghen/blink.lib',
        -- optional: provides snippets for the snippet source
        -- 'rafamadriz/friendly-snippets',
    },
    build = function()
        -- build the fuzzy matcher, optionally add a timeout to `pwait(timeout_ms)`
        -- you can use `gb` in `:Lazy` to rebuild the plugin as needed
        require('blink.cmp').build():pwait(60000)
    end,

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)

        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = 'default' },

        completion = {
            documentation = { auto_show = false },
            menu = {
                auto_show = true,
            },
            -- trigger = {
            --     show_on_keyword = false,
            --     show_on_trigger_character = false,
            -- }
        },

        -- (Default) list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"`
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "rust" },

        signature = { enabled = true, window = { show_documentation = false } }
    },
}
