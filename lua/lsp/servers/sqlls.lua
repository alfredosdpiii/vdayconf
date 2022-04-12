-- local handlers =  {
--   ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = EcoVim.ui.float.border}),
--   ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = EcoVim.ui.float.border}),
-- }
--
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.colorProvider = { dynamicRegistration = false }

require'lspconfig'.sqlls.setup {
  -- handlers = handlers,
  -- capabilities = capabilities,
  -- on_attach = function (client, bufnr)
  --   if client.server_capabilities.colorProvider then
  --       require"lsp/documentcolors".buf_attach(bufnr)
  --   end
  -- end,
  -- cmd = { "sql-language-server","p","--stdio" },
  cmd = { "sql-language-server", "up", "--method", "stdio" },
  filetypes ={"sql", "mysql"},
  settings = {}
}
