local cmp = require("cmp")
local luasnip = require("luasnip")

-- Load snippets from vscode (if using luasnip)
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-o>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
	['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        {
            name = 'sdl2',  -- Custom source for SDL2 autocompletion
            keyword_length = 3,  -- Minimum keyword length to trigger suggestions
            filetypes = { 'c', 'cpp' },  -- Filetypes to enable SDL2 autocompletion
            sources = {
                { name = 'sdl2_headers' },  -- Source for SDL2 headers
            },
        },
    },
    completion = {
        completeopt = 'menu,menuone,noinsert',
        max_menu_width = 80,
        max_abbr_width = 80,
        menu_height = 5,  -- Limit the number of items shown in the completion menu
        documentation = true,
    },
})

