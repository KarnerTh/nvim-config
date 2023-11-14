return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim",           opts = {} },
    { "williamboman/mason-lspconfig.nvim", opts = {} },
    {
      "j-hui/fidget.nvim",
      tag = "legacy",
      event = "LspAttach",
      opts = {},
    },
    { "folke/neodev.nvim", opts = {} },
  },
  init = function()
    require("tkarner.lsp")
  end,
}
