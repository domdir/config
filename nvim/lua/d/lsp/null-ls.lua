local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
    diagnostics.chktex,
    diagnostics.codespell,
    diagnostics.cspell.with({
      extra_args = {
        "--config",
        "~/.config/cspell/config.json",
      }
    }),
    diagnostics.editorconfig_checker,
    diagnostics.jsonlint,
    diagnostics.markdownlint,
    diagnostics.stylelint,
    code_actions.proselint,
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    -- formatting.black.with({ extra_args = { "--fast" } }),
    formatting.autopep8,
		formatting.stylua,
    -- diagnostics.flake8
	},
})
