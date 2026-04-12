return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" }, -- Only load this when you are about to save a file
    cmd = { "ConformInfo" },   -- Gives you a handy command to check formatter status
    
    config = function()
        require("conform").setup({
            -- 1. Map filetypes to their specific formatters
            formatters_by_ft = {
                html       = { "prettier" },
                css        = { "prettier" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                python     = { "isort", "black" }, -- isort sorts your imports, black formats the code
                lua        = { "stylua" },
                c          = { "clang-format" },
                cpp        = { "clang-format" },
                bash       = { "shfmt" },
            },
            
            -- 2. Format on save magic
            format_on_save = {
                timeout_ms = 500, -- Give it half a second to finish
                lsp_format = "fallback", -- The crucial setting! Stops formatter conflicts.
            },
        })

        -- 3. A manual keymap just in case you want to format without saving
        vim.keymap.set({ "n", "v" }, "<leader>fm", function()
            require("conform").format({ lsp_format = "fallback", timeout_ms = 500 })
        end, { desc = "Format file or range (Conform)" })
    end,
}
