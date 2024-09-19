local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings =
{
  { "<leader>/",  '<cmd>lua require("Comment.api").toggle.linewise()<CR>', desc = "Comment",                              nowait = true, remap = false },
  { "<leader>C",  "<cmd>:bufdo :Bdelete<CR>",                              desc = "Close All Buffers",                    nowait = true, remap = false },
  { "<leader>F",  "<cmd>FzfLua grep search= <cr>",                         desc = "Find Text",                            nowait = true, remap = false },
  { "<leader>b",  "<cmd>FzfLua buffers<cr>",                               desc = "Buffers",                              nowait = true, remap = false },
  { "<leader>c",  "<cmd>Bdelete!<CR>",                                     desc = "Close Buffer",                         nowait = true, remap = false },
  { "<leader>d",  group = "Debug",                                         nowait = true,                                 remap = false },
  { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>",       desc = "Toggle Breakpoint",                    nowait = true, remap = false },
  { "<leader>dc", "<cmd>lua require('dap').continue()<cr>",                desc = "Continue",                             nowait = true, remap = false },
  { "<leader>dt", "<cmd>lua require('dap-go').debug_test()<cr>",           desc = "Debug Test",                           nowait = true, remap = false },
  { "<leader>du", "<cmd>lua require('dapui').toggle()<cr>",                desc = "Toggle UI",                            nowait = true, remap = false },
  { "<leader>e",  "<cmd>NvimTreeToggle<cr>",                               desc = "Explorer",                             nowait = true, remap = false },
  { "<leader>f",  "<cmd>FzfLua files<CR>",                                 desc = "Find Files",                           nowait = true, remap = false },
  { "<leader>g",  group = "Git",                                           nowait = true,                                 remap = false },
  { "<leader>gA", "<cmd>Gitsigns stage_buffer<cr>",                        desc = "Stage buffer",                         nowait = true, remap = false },
  { "<leader>gR", "<cmd>Gitsigns reset_buffer)<cr>",                       desc = "Reset Buffer",                         nowait = true, remap = false },
  { "<leader>ga", "<cmd>Gitsigns stage_hunk<cr>",                          desc = "Stage hunk",                           nowait = true, remap = false },
  { "<leader>gb", "<cmd>ToggleBlame <cr>",                                 desc = "Toggle git blame",                     nowait = true, remap = false },
  { "<leader>gc", "<cmd>FzfLua git_commits <cr>",                          desc = "Commits",                              nowait = true, remap = false },
  { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>",                       desc = "Diff",                                 nowait = true, remap = false },
  { "<leader>gj", "<cmd>Gitsigns next_hunk<cr>",                           desc = "Next Hunk",                            nowait = true, remap = false },
  { "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>",                           desc = "Prev Hunk",                            nowait = true, remap = false },
  { "<leader>gl", "<cmd>Gitsigns blame_line<cr>",                          desc = "Blame",                                nowait = true, remap = false },
  { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>",                        desc = "Preview Hunk",                         nowait = true, remap = false },
  { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>",                          desc = "Reset Hunk",                           nowait = true, remap = false },
  { "<leader>gs", "<cmd>FzfLua git_status <cr>",                           desc = "Show status",                          nowait = true, remap = false },
  { "<leader>gm", "<cmd>GitConflictListQf <cr>",                           desc = "Show stuff to merge",                  nowait = true, remap = false },
  { "<leader>h",  "<cmd>nohlsearch<CR>",                                   desc = "No Highlight",                         nowait = true, remap = false },
  { "<leader>l",  group = "LSP",                                           nowait = true,                                 remap = false },
  { "<leader>la", "<cmd>FzfLua lsp_code_actions <cr>",                     desc = "Code Action",                          nowait = true, remap = false },
  { "<leader>ld", "<cmd>FzfLua diagnostics_workspace<cr>",                 desc = "Document Diagnostics",                 nowait = true, remap = false },
  { "<leader>lf", "<cmd>Format<cr>",                                       desc = "Format",                               nowait = true, remap = false },
  { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>",               desc = "Next Diagnostic",                      nowait = true, remap = false },
  { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>",               desc = "Prev Diagnostic",                      nowait = true, remap = false },
  { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>",                   desc = "CodeLens Action",                      nowait = true, remap = false },
  { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>",              desc = "Quickfix",                             nowait = true, remap = false },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                     desc = "Rename",                               nowait = true, remap = false },
  { "<leader>lw", "<cmd>FzfLua diagnostics_workspace<cr>",                 desc = "Workspace Diagnostics",                nowait = true, remap = false },
  { "<leader>r",  "<cmd>FzfLua resume <cr>",                               desc = "Resume fzf",                           nowait = true, remap = false },
  { "<leader>s",  group = "Search",                                        nowait = true,                                 remap = false },
  { "<leader>sR", "<cmd>Fzf registers<cr>",                                desc = "Registers",                            nowait = true, remap = false },
  { "<leader>sf", "<cmd>NvimTreeFindFile<cr>",                             desc = "Find File in Explorer",                nowait = true, remap = false },
  { "<leader>sr", "<cmd>Fzf oldfiles<cr>",                                 desc = "Open Recent File",                     nowait = true, remap = false },
  { "<leader>x",  group = "Util",                                          nowait = true,                                 remap = false },
  { "<leader>xd", "<cmd>lua require('dbee').toggle()<cr>",                 desc = "Toggle sql ide",                       nowait = true, remap = false },
  { "<leader>xi", "<cmd>IBLToggle<cr>",                                    desc = "Toggle indent lines",                  nowait = true, remap = false },
  { "<leader>xm", "<cmd>FzfLua marks<cr>",                                 desc = "Marks",                                nowait = true, remap = false },
  { "<leader>z",  "<cmd>:%bd|e#|bd#<CR>",                                  desc = " lose All Buffers except current one", nowait = true, remap = false },
}

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeoutlen = 300

    local wk = require("which-key")
    wk.add(mappings, opts)
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
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 1,                    -- spacing between columns
      align = "left",                 -- align columns left, center or right
    },
    show_help = false,                -- show help message on the command line when the popup is visible
  },
}
