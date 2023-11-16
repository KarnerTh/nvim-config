return {
  "akinsho/flutter-tools.nvim",
  event = "VeryLazy",
  opts = {
    fvm = true,
    dev_log = {
      open_cmd = "tabedit",
    },
    lsp = {
      on_attach = require("tkarner.lsp.handlers").on_attach,
      capabilities = require("tkarner.lsp.handlers").capabilities,
      settings = {
        lineLength = 120,
      },
    },
  },
}
