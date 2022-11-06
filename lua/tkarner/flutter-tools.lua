require("flutter-tools").setup({
	fvm = true,
	dev_log = {
		open_cmd = "tabedit",
	},
	lsp = {
		on_attach = require("tkarner.lsp.handlers").on_attach,
		capabilities = require("tkarner.lsp.handlers").capabilities,
	},
})
