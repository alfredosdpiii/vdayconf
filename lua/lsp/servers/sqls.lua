local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = EcoVim.ui.float.border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = EcoVim.ui.float.border}),
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.colorProvider = { dynamicRegistration = false }

require'lspconfig'.sqls.setup{
  handlers = handlers,
  capabilities = capabilities,
  on_attach = function (client, bufnr)
    if client.server_capabilities.colorProvider then
        require"lsp/documentcolors".buf_attach(bufnr)
    end
  end,
  cmd = {"~/go/bin/sqls", "-config", "~/.config/sqls/config.yml"},
  filetypes = {"sql", "mysql"},
  settings = {
    sqls = {
      connections = {
        -- {
        --   driver = 'mysql',
        --   dataSourceName = 'root:root@tcp(127.0.0.1:13306)/world',
        -- },
        {
          driver = 'postgresql',
          dataSourceName = 'host=127.0.0.1 port=5432 user=postgres password=1234 dbname=avionschool_development sslmode=disable',
        },
      },
    },
  },
}
