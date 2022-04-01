local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end
--
-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- local formatting = null_ls.builtins.formatting
-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics
--
-- null_ls.setup({
-- 	debug = false,
--     autostart = true,
--     on_attach = function(client)
--         if client.resolved_capabilities.document_formatting then
--             vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
--         end
--     end,
-- 	sources = {
-- 		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
-- 		formatting.black.with({ extra_args = { "--fast" } }),
-- 		formatting.stylua,
--         formatting.stylelint,
--         diagnostics.stylelint,
--         -- formatting.eslint,
--         -- diagnostics.eslint,
--     -- diagnostics.flake8
-- 	},
-- })
local b = null_ls.builtins

null_ls.setup {
  sources = {
    b.formatting.prettier.with {
      filetypes = { 'typescriptreact', 'typescript' },
      condition = function(utils)
        return utils.root_has_file '.prettierrc.json' and not utils.root_has_file '.eslintrc.js'
      end,
      command = './node_modules/.bin/prettier',
    },

    b.formatting.prettier.with {
      filetypes = { 'graphql' },
      condition = function(utils)
        return utils.root_has_file '.prettierrc.json'
      end,
      command = './node_modules/.bin/prettier',
    },

    b.diagnostics.stylelint.with {
      filetypes = { 'css', 'scss', 'vue' },
      condition = function(utils)
        return utils.root_has_file '.stylelintrc.json'
      end,
      command = './node_modules/.bin/stylelint',
    },
    b.formatting.stylelint.with {
      filetypes = { 'css', 'scss' },
      condition = function(utils)
        return utils.root_has_file '.stylelintrc.json'
      end,
      command = './node_modules/.bin/stylelint',
    },

    b.formatting.stylua.with {
      condition = function(utils)
        return utils.root_has_file 'stylua.toml'
      end,
    },

    b.code_actions.gitsigns,
  },
  diagnostics_format = '#{m} [#{c}]',
  -- on_attach = require('j.plugins.lsp').on_attach,
}
