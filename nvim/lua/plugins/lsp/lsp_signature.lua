return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
        require 'lsp_signature'.setup(opts)
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local bufnr = args.buf
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if vim.tbl_contains({ 'null-ls' }, client.name) then -- blacklist lsp
                    return
                end
                require("lsp_signature").on_attach({
                    max_height = 12, -- max height of signature floating_window
                    max_width = 80,  -- max_width of signature floating_window, line will be wrapped if exceed max_width
                    -- the value need >= 40
                    wrap = true,     -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
                    floating_window = true,
                }, bufnr)
            end,
        })
    end
}
