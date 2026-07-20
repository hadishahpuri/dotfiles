
return {
    "neovim/nvim-lspconfig",
    lazy = false,
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "williamboman/mason-lspconfig.nvim" },
        { "nvim-java/nvim-java" },
    },
    config = function()
        local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        -- Show source in diagnostics
        vim.diagnostic.config({
            update_in_insert = true,
            severity_sort = true,
            virtual_text = false,
            float = {
                source = true,
            },
        })

        -- Remove background of virtual text
        local table = vim.api.nvim_get_hl(0, { name = "DiagnosticVirtualTextError" })
        local newTable = vim.tbl_extend("force", table, { bg = "NONE", ctermbg = "NONE" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", newTable)

        -- Give every server nvim-cmp's completion capabilities on top of the defaults
        local capabilities = vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            require("cmp_nvim_lsp").default_capabilities()
        )
        vim.lsp.config("*", { capabilities = capabilities })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local bufnr = args.buf
                local map = function(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
                end

                map("n", "gd", vim.lsp.buf.definition, "Go to definition")
                map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
                map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
                map("n", "go", vim.lsp.buf.type_definition, "Go to type definition")
                map("n", "gr", vim.lsp.buf.references, "Go to reference")
                map("n", "<F2>", vim.lsp.buf.rename, "Rename symbol")
                map("n", "<F3>", function()
                    vim.lsp.buf.format({ async = true })
                end, "Format file")
                map("x", "<F3>", function()
                    vim.lsp.buf.format({ async = true })
                end, "Format selection")
                map("n", "<F4>", vim.lsp.buf.code_action, "Execute code action")

                vim.api.nvim_create_autocmd("CursorHold", {
                    buffer = bufnr,
                    callback = function()
                        vim.diagnostic.open_float(0, {
                            scope = "cursor",
                            focusable = false,
                            close_events = {
                                "CursorMoved",
                                "CursorMovedI",
                                "BufHidden",
                                "InsertCharPre",
                                "WinLeave",
                            },
                        })
                    end,
                })
            end,
        })

        -- Installs servers via Mason and enables them with vim.lsp.enable()
        require("mason-lspconfig").setup({
            ensure_installed = { "intelephense", "lua_ls", "pyright", "ts_ls" },
        })

        -- Neovim-aware Lua language server
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    telemetry = { enable = false },
                    runtime = { version = "LuaJIT" },
                    diagnostics = { globals = { "vim" } },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME .. "/lua",
                            vim.fn.stdpath("config") .. "/lua",
                        },
                    },
                },
            },
        })

        vim.lsp.config("pyright", {
            root_dir = function(bufnr, on_dir)
                local fname = vim.api.nvim_buf_get_name(bufnr)
                local root = vim.fs.root(fname, { "manage.py", "pyproject.toml", "setup.py", ".git" })
                on_dir(root)
            end,
            on_attach = function()
                vim.notify("Pyright attached to buffer", vim.log.levels.INFO)
            end,
            settings = {
                python = {
                    pythonPath = vim.fn.trim(vim.fn.system("pyenv which python")),
                    analysis = {
                        typeCheckingMode = "basic",
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        extraPaths = { vim.fn.getcwd() },
                    },
                },
            },
        })
    end,
}
