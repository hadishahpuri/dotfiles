-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

reload('user.plugins')
lvim.builtin.telescope.active = true
lvim.builtin.telescope.theme = "ivy"
vim.o.wrap = true
lvim.format_on_save.enabled = true
vim.opt.termbidi = true
vim.opt.relativenumber = true
-- local api = vim.api
-- api.nvim_create_autocmd(
--   "BufWritePre",
--   { pattern = '*.php,*.ts,*.js,*.tsx', command = ':Prettier' }
-- )

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "prettier",
    filetypes = { "typescript", "typescriptreact", "php", "tsx", "json" },
  },
}
