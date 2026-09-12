return {
    -- root_markers = {'lazy-lock.json'},
    settings = {
        Lua = {
            codeLens = { enable = true },
            hint = { enable = true, semicolon = 'Disable' },
            diagnostics = { globals = { 'vim' } },
        },
    },
}
