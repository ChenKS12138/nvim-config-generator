require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "ts_ls", "clangd", "pylsp", "gopls" }

-- Use the new Neovim 0.11+ way to enable servers
vim.lsp.enable(servers)

-- Enable rust-analyzer separately
vim.lsp.enable("rust_analyzer")

-- Inlay hints
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})
