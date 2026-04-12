return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- Only load this plugin when you start typing
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",         -- Connects cmp to the LSP we just set up
        "L3MON4D3/LuaSnip",             -- The core snippet engine
        "saadparwaiz1/cmp_luasnip",     -- Tells cmp how to talk to LuaSnip
        "rafamadriz/friendly-snippets", -- The massive collection of sample code/boilerplates
    },
    
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        -- Load the friendly-snippets collection (like HTML boilerplates)
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            -- Tell cmp to use LuaSnip to expand the snippets
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            
            -- Keybindings for the completion menu
            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item(), -- Ctrl+n to go down the list
                ["<C-p>"] = cmp.mapping.select_prev_item(), -- Ctrl+p to go up the list
                ["<C-Space>"] = cmp.mapping.complete(),     -- Manually trigger the menu
                ["<CR>"] = cmp.mapping.confirm({            -- Press Enter to accept the suggestion
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true, 
                }), 
                -- Use Tab and Shift-Tab to jump through variables within a snippet (like an HTML boilerplate)
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            
            -- The sources for your autocomplete menu (Order matters: LSP first, snippets second)
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" }, 
            }),
        })
    end,
}
