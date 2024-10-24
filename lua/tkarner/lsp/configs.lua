local lspconfig = require("lspconfig")
local servers = {
  "cssls",
  "eslint",
  "gopls",
  "graphql",
  "graphql",
  "jsonls",
  "lua_ls",
  "prismals",
  "svelte",
  "terraformls",
  "ts_ls",
  "yamlls",
  "vacuum",
  "csharp_ls"
}

vim.filetype.add {
  pattern = {
    ['.*/api_defs/.*%.yaml'] = 'yaml.openapi',
  },
}

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("tkarner.lsp.handlers").on_attach,
    capabilities = require("tkarner.lsp.handlers").capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "tkarner.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end
  lspconfig[server].setup(opts)
end
