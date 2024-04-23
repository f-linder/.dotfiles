local lsp = require("lsp-zero")
lsp.preset("recommended")

local cmp = require("cmp")
local keymap = vim.keymap -- for conciseness


vim.opt.completeopt = "menu,menuone,preview,noinsert"

-- icons
lsp.set_preferences({
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I',
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    -- set keybinds
    keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts) -- got to declaration
    keymap.set("n", "gf", function() vim.lsp.buf.references() end, opts) -- show definition, references
    keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts) -- see available code actions
    keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts) -- smart rename
    keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts) -- show  diagnostics for line
    keymap.set("n", "<leader>dk", function() vim.diagnostic.goto_prev() end, opts) -- jump to previous diagnostic in buffer
    keymap.set("n", "<leader>dj", function() vim.diagnostic.goto_next() end, opts) -- jump to next diagnostic in buffer
    keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts) -- show documentation for what is under cursor
end)

lsp.setup()

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
    return
end

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<c-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<c-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    -- sources for autocompletion
    sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- lsp
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
        { name = "vsnip"},
        { name = "nvim_lsp_signature_help"},
        { name = "nvim_lua"},
    }),
})
