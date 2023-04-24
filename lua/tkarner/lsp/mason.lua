require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"golangci_lint_ls",
		"gopls",
	},
})
