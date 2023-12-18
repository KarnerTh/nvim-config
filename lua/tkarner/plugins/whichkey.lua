local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings = {
  ["/"] = { '<cmd>lua require("Comment.api").toggle.linewise()<CR>', "Comment" },
  ["b"] = { "<cmd>FzfLua buffers<cr>", "Buffers", },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  ["C"] = { "<cmd>:bufdo :Bdelete<CR>", "Close All Buffers" },
  ["z"] = { "<cmd>:%bd|e#|bd#<CR>", " lose All Buffers except current one" }, -- https://stackoverflow.com/a/42071865
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["f"] = { "<cmd>FzfLua files<CR>", "Find Files" },
  ["F"] = { "<cmd>FzfLua grep search= <cr>", "Find Text" },
  ["r"] = { "<cmd>FzfLua resume <cr>", "Resume fzf" },
  g = {
    name = "Git",
    j = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
    k = { "<cmd>Gitsigns prev_hunk<cr>", "Prev Hunk" },
    l = { "<cmd>Gitsigns blame_line<cr>", "Blame" },
    p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
    r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
    R = { "<cmd>Gitsigns reset_buffer)<cr>", "Reset Buffer" },
    d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
    s = { "<cmd>FzfLua git_status <cr>", "Show status" },
    b = { "<cmd>ToggleBlame <cr>", "Toggle git blame" },
    a = { "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk" },
    A = { "<cmd>Gitsigns stage_buffer<cr>", "Stage buffer" }
  },
  l = {
    name = "LSP",
    a = { "<cmd>FzfLua lsp_code_actions <cr>", "Code Action" },
    d = {
      "<cmd>FzfLua diagnostics_workspace<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>FzfLua diagnostics_workspace<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>Format<cr>", "Format" },
    j = {
      "<cmd>lua vim.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
  },
  s = {
    name = "Search",
    r = { "<cmd>Fzf oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Fzf registers<cr>", "Registers" },
    f = { "<cmd>NvimTreeFindFile<cr>", "Find File in Explorer" },
  },
  d = {
    name = "Debug",
    u = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle UI" },
    b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    t = { "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test" },
    c = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
  },
  x = {
    name = "Util",
    m = { "<cmd>FzfLua marks<cr>", "Marks" },
    i = { "<cmd>IBLToggle<cr>", "Toggle indent lines" },
    d = { "<cmd>lua require('dbee').toggle()<cr>", "Toggle sql ide" },
  },
}

local vopts = {
  mode = "v",
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,
  noremap = true,
  nowait = true,
}

local vmappings = {
  ["/"] = { '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', "Comment (gc)" },
}

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeoutlen = 300

    local wk = require("which-key")
    wk.register(mappings, opts)
    wk.register(vmappings, vopts)
  end,
  opts = {
    plugins = {
      marks = false,     -- shows a list of your marks on ' and `
      registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = false,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = false,      -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        windows = true,       -- default bindings on <c-w>
        nav = true,           -- misc bindings to work with windows
        z = false,            -- bindings for folds, spelling and others prefixed with z
        g = false,            -- bindings for prefixed with g
      },
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>",   -- binding to scroll up inside the popup
    },
    window = {
      border = "rounded",       -- none, single, double, shadow
      position = "bottom",      -- bottom, top
      margin = { 0, 0, 0, 0 },  -- extra window margin [top, right, bottom, left]
      padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 },                                             -- min and max height of the columns
      width = { min = 20, max = 50 },                                             -- min and max width of the columns
      spacing = 1,                                                                -- spacing between columns
      align = "left",                                                             -- align columns left, center or right
    },
    ignore_missing = true,                                                        -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = false,                                                            -- show help message on the command line when the popup is visible
    triggers = "auto",                                                            -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      i = { "j", "k" },
      v = { "j", "k" },
    },
  },
}
