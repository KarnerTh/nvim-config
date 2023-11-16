return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "bash",
        "css",
        "dart",
        "dockerfile",
        "gitignore",
        "go",
        "gomod",
        "gowork",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "make",
        "prisma",
        "markdown",
        "regex",
        "scss",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "graphql",
      },
      sync_install = false,
      ignore_install = { "" }, -- List of parsers to ignore installing
      highlight = {
        enable = true,      -- false will disable the whole extension
        disable = { "" },   -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
      },
      autopairs = {
        enable = true,
      },
      indent = { enable = true, disable = { "yaml" } },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    })
  end,
}
