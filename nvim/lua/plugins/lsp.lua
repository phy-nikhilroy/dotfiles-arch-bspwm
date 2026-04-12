return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp", 
    },
    
    config = function()
        -- 1. Initialize Mason
        require("mason").setup()

        -- 2. Tell Mason what to install
        -- In Neovim 0.11+, mason-lspconfig automatically enables these servers for you!
        require("mason-lspconfig").setup({
            ensure_installed = {
                "html", "cssls", "ts_ls", "clangd", "pyright", "bashls", "lua_ls"
            }
        })

        -- 3. Get the enhanced autocompletion capabilities from nvim-cmp
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- 4. THE NEOVIM 0.11+ NATIVE WAY:
        -- Apply these completion capabilities to ALL (*) language servers globally
        vim.lsp.config("*", {
            capabilities = capabilities,
        })

        -- 5. Setup custom UI keymaps only when an LSP attaches to a buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local map = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                -- We map these to fzf-lua for a beautiful popup UI instead of the default text output
                map("gd", require("fzf-lua").lsp_definitions, "Go to Definition")
                map("gr", require("fzf-lua").lsp_references, "Go to References")
                
                map("K", vim.lsp.buf.hover, "Hover Documentation")
                map("<leader>rn", vim.lsp.buf.rename, "Rename Variable")
            end,
        })
    end,
}
