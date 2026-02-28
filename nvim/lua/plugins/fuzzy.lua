local initial_cwd = vim.loop.cwd()

getRoot = function()
    local handle = io.popen("git -C " .. initial_cwd .. " rev-parse --show-toplevel 2>/dev/null")
    if not handle then
        return initial_cwd
    end

    local result = handle:read("*a")
    handle:close()

    result = result:gsub("[\n\r]", "")

    if result == "" then
        return initial_cwd
    end

    return result
end

return {
    'ibhagwan/fzf-lua',
    branch = 'main',
    -- cmd = 'fd --type f --hidden --exclude .git',
    keys = {
        { '<Leader>f',  '<cmd>lua require("fzf-lua").files({ cwd = getRoot() })<CR>',             { silent = true } },
        { '<Leader>b',  '<cmd>lua require("fzf-lua").buffers()<CR>',                              { silent = true } },
        { '<Leader>o',  '<cmd>lua require("fzf-lua").files({ cwd = vim.fn.expand("%:p:h")})<CR>', { silent = true } },
        { '<Leader>iw', '<cmd>lua require("fzf-lua").grep_cword({ cwd = getRoot()  })<CR>',       { silent = true } },
        { '<Leader>iW', '<cmd>lua require("fzf-lua").grep_cWORD({ cwd = getRoot() })<CR>',        { silent = true } },
        { '<Leader>/',  '<cmd>lua require("fzf-lua").grep({ cwd = getRoot() })<CR>',              { silent = true } },
        {
            '<Leader>/',
            '<cmd>lua require("fzf-lua").grep_visual({ cwd = getRoot() })<CR>',
            { silent = true },
            mode = 'v',
        },
        { '<F4>', '<cmd>lua require("fzf-lua").lsp_code_actions({ winopts = { preview = { layout = "horizontal" }}})<CR>',
            { silent = true } },
    },
    dependencies = {
        { 'nvim-tree/nvim-web-devicons' },
        { 'junegunn/fzf',               branch = 'master', build = "./install --bin" },
    },
    config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({
            winopts = {
                width = 0.9,
                height = 0.95,
                preview = {
                    scrolloff = 5,
                    scrollbar = "▌▐",
                    preview   = "wrap",
                    layout    = "vertical",
                    vertical  = 'up:50%',
                },
                on_create = function()
                    vim.keymap.set("t", "<C-u>", "<S-up>", { silent = true, buffer = true, remap = true })
                    vim.keymap.set("t", "<C-d>", "<S-down>", { silent = true, buffer = true, remap = true })
                end
            },
            keymap = {
                fzf = {
                    ["ctrl-l"] = "first",
                    ["ctrl-h"] = "last",
                    ["ctrl-a"] = "select-all",
                    ["ctrl-c"] = "deselect-all",
                }
            },
            git = {
                files = {
                    cmd = 'git ls-files --exclude-standard --cached --others'
                }
            },
            files = {
                cmd = 'fd --type f --hidden --exclude .git',
            }
        })
    end
}
