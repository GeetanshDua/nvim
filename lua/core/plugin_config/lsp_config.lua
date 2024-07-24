--[[
-- Load Mason and LSP configuration for Neovim
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "clangd" } -- Ensure lua_ls and clangd are installed
})

-- Function to handle LSP client attachment
local on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
    -- Key mappings
    vim.api.nvim_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
    -- Add other key mappings and setup here
end

-- Setup capabilities for LSP and completion
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup Lua Language Server (lua_ls)
require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Setup clangd for C/C++ development
require('lspconfig').clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
]]--

-- Load Mason and LSP configuration for Neovim
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "clangd" } -- Ensure lua_ls and clangd are installed
})

-- Function to handle LSP client attachment
local on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
    -- Key mappings
    vim.api.nvim_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
    -- Add other key mappings and setup here
end

-- Setup capabilities for LSP and completion
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup Lua Language Server (lua_ls)
require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Setup clangd for C/C++ development
require('lspconfig').clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
]]--

-- Load Mason and LSP configuration for Neovim
-- Load Mason and LSP configuration for Neovim
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "clangd" } -- Ensure lua_ls and clangd are installed
})

-- Function to filter diagnostics
local function filter_diagnostics(diagnostics, ignored_codes)
    return vim.tbl_filter(function(diagnostic)
        -- Filter out diagnostics based on severity or other criteria
        -- For example, filter only syntax errors (1)
        return diagnostic.severity == vim.lsp.protocol.DiagnosticSeverity.Error
               and not vim.tbl_contains(ignored_codes, diagnostic.code)
    end, diagnostics)
end

-- Diagnostic codes to ignore (if needed)
local ignored_codes = { "6133", "6196" } -- Add the diagnostic codes for your specific language server

-- Custom on_publish_diagnostics handler
local function custom_on_publish_diagnostics(_, result, ctx, config)
    -- Filter diagnostics to include only syntax errors
    result.diagnostics = filter_diagnostics(result.diagnostics, ignored_codes)
    vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
end

-- Function to handle LSP client attachment
local on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
    -- Key mappings
    vim.api.nvim_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
    -- Add other key mappings and setup here
end

-- Setup capabilities for LSP and completion
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup Lua Language Server (lua_ls)
require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = {
        ["textDocument/publishDiagnostics"] = custom_on_publish_diagnostics,
    },
}

-- Setup clangd for C/C++ development
require('lspconfig').clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = {
        ["textDocument/publishDiagnostics"] = custom_on_publish_diagnostics,
    },
}
