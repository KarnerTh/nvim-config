local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("tkarner.lsp.lsp-installer")
require("tkarner.lsp.handlers").setup()
require("tkarner.lsp.null-ls")
