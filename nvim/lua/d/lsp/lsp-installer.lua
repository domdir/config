local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local servers = {
  "rust_analyzer",
  "sumneko_lua",
  "jsonls",
  "pyright",
}

lsp_installer.setup({
  ensure_installed = servers,
})

local lsp_config = require "lspconfig"

for _, server in ipairs(servers) do
  local opts = {
    on_attach = require("d.lsp.handlers").on_attach,
    capabilities = require("d.lsp.handlers").capabilities,
  }

  if server == "rust_analyzer" then
    require('rust-tools').setup({
      server = opts
    })
  end

	if server == "sumneko_lua" then
	 	local sumneko_opts = require("d.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    lsp_config.sumneko_lua.setup(opts)
	end

	if server == "jsonls" then
	 	local jsonls_opts = require("d.lsp.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    lsp_config.jsonls.setup(opts)
	end

  if server == "pyright" then
    require("d.lsp.settings.python")
    lsp_config.pyright.setup(opts)
  end
end
