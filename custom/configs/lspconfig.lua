local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
-- https://github.com/williamboman/mason-lspconfig.nvim
local servers = { "html", "cssls", "ts_ls", "clangd", "rust_analyzer", "pylsp", "gopls" }

local on_attach = function(client, bufnr)
  vim.lsp.inlay_hint.enable(true)
  require("plugins.configs.lspconfig").on_attach(client, bufnr)
end


for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}
