require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "tsserver", "clangd", "rust_analyzer", "pylsp", "gopls" }
vim.lsp.enable(servers)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

-- read :h vim.lsp.config for changing options of lsp servers 
