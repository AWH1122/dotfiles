require("config.options")
require("config.remap")
require("core.lazy")
require("core.lsp")

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'python', 'lua', 'vimdoc', 'css', 'toml', 'ini' },
    callback = function()
        vim.treesitter.start()
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo.foldmethod = 'expr'
    end
})

vim.api.nvim_create_user_command('DiffOrig', function()
    local filename = vim.fn.expand('%')
    if filename == '' then
        vim.notify('No file associated with this buffer', vim.log.levels.ERROR)
        return
    end

    -- Open a vertical split and set it as a scratch buffer
    vim.cmd('vert new')
    vim.bo.buftype = 'nofile'
    vim.bo.bufhidden = 'wipe'

    -- Read the saved file contents and delete the empty first line
    vim.cmd('read ++edit ' .. vim.fn.fnameescape(filename))
    vim.cmd('0d_')

    -- Turn on diff mode for both windows
    vim.cmd('diffthis')
    vim.cmd('wincmd p')
    vim.cmd('diffthis')
end, { desc = 'Diff current buffer with the saved file on disk' })

vim.api.nvim_create_autocmd("BufWinEnter", {
    callback = function(ctx)
        local buf = ctx.buf

        if not vim.bo[buf].modifiable or vim.bo[buf].buftype == "nofile" then
            vim.keymap.set("n", "<Esc>", function()
                if #vim.api.nvim_list_wins() > 1 then
                    vim.api.nvim_win_close(0, false)
                end
            end, {
                buffer = buf,
                desc = "Close temporary window",
            })
        end
    end,
})
