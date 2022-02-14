require'which-key'.setup {
--   plugins = {
--     marks = true, -- shows a list of your marks on ' and `
--     registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
--     -- the presets plugin, adds help for a bunch of default keybindings in Neovim
--     -- No actual key bindings are created
--     spelling = {
--       enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
--       suggestions = 20, -- how many suggestions should be shown in the list?
--     },
--     presets = { operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
--       motions = false, -- adds help for motions text_objects = false, -- help for text objects triggered after entering an operator
--       windows = false, -- default bindings on <c-w>
--       nav = false, -- misc bindings to work with windows
--       z = false, -- bindings for folds, spelling and others prefixed with z
--       g = false, -- bindings for prefixed with g
--     },
--   },
--   -- add operators that will trigger motion and text object completion
--   -- to enable all native operators, set the preset / operators plugin above
--   operators = { gc = "Comments" },
--   key_labels = {
--     -- override the label used to display some keys. It doesn't effect WK in any other way.
--     -- For example:
--     -- ["<space>"] = "SPC",
--     -- ["<cr>"] = "RET",
--     -- ["<tab>"] = "TAB",
--   },
--   icons = {
--     breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
--     separator = "➜", -- symbol used between a key and it's label
--     group = "+", -- symbol prepended to a group
--   },
--   window = {
--     border = "single", -- none, single, double, shadow
--     position = "bottom", -- bottom, top
--     margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
--     padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
--   },
--   layout = {
--     height = { min = 4, max = 25 }, -- min and max height of the columns
--     width = { min = 20, max = 50 }, -- min and max width of the columns
--     spacing = 4, -- spacing between columns
--     align = "left", -- align columns left, center or right
--   },
--   ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
--   hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
--   show_help = true, -- show help message on the command line when the popup is visible
--   -- triggers = "auto", -- automatically setup triggers
--   triggers = {"<leader>"}, -- or specify a list manually
--   triggers_blacklist = {
--     -- list of mode / prefixes that should never be hooked by WhichKey
--     -- this is mostly relevant for key maps that start with a native binding
--     -- most people should not need to change this
--     i = { "j", "k" },
--     v = { "j", "k" },
--   },
-- }
--
-- local opts = {
--   mode = "n", -- NORMAL mode
--   prefix = "<leader>",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = false, -- use `nowait` when creating keymaps
-- }
--
-- local mappings = {
--
--   -- ignore
--   ["1"] = "which_key_ignore",
--   ["2"] = "which_key_ignore",
--   ["3"] = "which_key_ignore",
--   ["4"] = "which_key_ignore",
--   ["5"] = "which_key_ignore",
--   ["6"] = "which_key_ignore",
--   ["7"] = "which_key_ignore",
--   ["8"] = "which_key_ignore",
--   ["9"] = "which_key_ignore",
--
--   -- single
--   ["+"] = { '<cmd>vertical resize +2<CR>',               'resize +2' },
--   ["-"] = { '<cmd>vertical resize -2<CR>',               'resize +2' },
--   ["="] = { '<C-W>=',                                    'balance windows' },
--   ["v"] = { '<C-W>v',                                    'split right' },
--   ["V"] = { '<C-W>s',                                    'split below' },
--   ["q"] = { 'quicklist' },
--
--   ["/"] = {
--     name = "Dashboard",
--     ["/"] = { '<cmd>Dashboard<CR>',                      'open dashboard' },
--     ["c"] = { ':e $MYVIMRC<CR>',                         'open init' },
--     ["s"] = { '<cmd>PackerSync<CR>',                     'packer sync' },
--     ["u"] = { '<cmd>PackerUpdate<CR>',                   'packer update' },
--   },
--
--   a = {
--     name = "Actions",
--     m = { '<cmd>MarkdownPreviewToggle<CR>',              'markdown preview' },
--     n = { '<cmd>set nonumber!<CR>',                      'line numbers' },
--     r = { '<cmd>set norelativenumber!<CR>',              'relative number' },
--     t = { '<cmd>ToggleTerm direction=float<CR>',         'terminal float' },
--   },
--
--   b = {
--     name = "Buffer",
--     b = { '<cmd>BufferMovePrevious<CR>',                 'Move back' },
--     c = { '<cmd>BufferCloseAllButCurrent<CR>',           'Close but current' },
--     d = { '<cmd>BufferOrderByDirectory<CR>',             'Order by directory' },
--     f = { '<cmd>bfirst<CR>',                             'First buffer' },
--     l = { '<cmd>BufferCloseBuffersLeft<CR>',             'Close Left' },
--     r = { '<cmd>BufferCloseBuffersRight<CR>',            'Close Right' },
--     n = { '<cmd>BufferMoveNext<CR>',                     'Move next' },
--     p = { '<cmd>BufferPick<CR>',                         'Pick Buffer' },
--   },
--
--   c = {
--     name = "LSP",
--     a = { '<cmd>Telescope lsp_code_action<CR>',          'telescope code action' },
--     d = { '<cmd>TroubleToggle<CR>',                      'local diagnostics' },
--     D = { '<cmd>Telescope diagnostics<CR>',              'workspace diagnostics' },
--     f = { 'format' },
--     i = { '<cmd>TSLspImportAll<CR>',                     'import all'},
--     l = { 'line diagnostics' },
--     o = { '<cmd>TSLspOrganize<CR>',                      'organize imports'},
--     q = { '<cmd>TSLspFixCurrent<CR>',                    'quick fix' },
--     r = { 'rename' },
--     s = { '<cmd>Telescope symbols<CR>',                  'symbols' },
--   },
--
--   d = {
--     name = "Debug",
--     a = { 'attach' },
--     b = { 'breakpoint' },
--     c = { 'continue' },
--     d = { 'continue' },
--     h = { 'visual hover' },
--     i = { 'step into' },
--     o = { 'step over' },
--     O = { 'step out' },
--     s = { 'scopes' },
--   },
--
--   g = {
--     name = "Git",
--     a = { '<cmd>!git add %:p<CR>',                                   'add current' },
--     A = { '<cmd>!git add .<CR>',                                     'add all' },
--     b = { '<cmd>lua require("blame").open()<CR>',                    'blame' },
--     d = { '<cmd>lua require("plugins.diffview").toggle()<CR>',       'diff file' },
--     g = { 'lazygit' },
--     h = {
--       name = "Hunk",
--       b = "blame line",
--       d = "diff hunk",
--       p = "preview",
--       R = "reset buffer",
--       r = "reset hunk",
--       s = "stage hunk",
--       S = "stage buffer",
--       t = "toggle deleted",
--       u = "undo stage",
--     },
--     l = {
--       name = "Log",
--       a = "commits",
--       c = "buffer commits",
--     },
--     m = { 'blame line' },
--     s = { '<cmd>Telescope git_status<CR>',                           'status' },
--   },
--
--   p = {
--     name = "Project",
--     f = { 'file' },
--     w = { 'word' },
--     l = { "<cmd>lua require'telescope'.extensions.repo.cached_list{file_ignore_patterns={'/%.cache/', '/%.cargo/', '/%.local/', '/%timeshift/', '/usr/', '/srv/', '/%.oh%-my%-zsh'}}<CR>", 'list' },
--     t = { "<cmd>TodoTrouble<CR>",                                    'todo' },
--     s = { "<cmd>SessionSave<CR>",                                    'save session' }
--   },
--
--   s = {
--     name = "Search",
--     c = { '<cmd>Telescope colorscheme<CR>',                          'color schemes' },
--     d = { '<cmd>lua require("plugins.telescope").edit_neovim()<CR>', 'dotfiles' },
--     h = { '<cmd>Telescope oldfiles<CR>',                             'file history' },
--     H = { '<cmd>Telescope command_history<CR>',                      'command history' },
--     s = { '<cmd>Telescope search_history<CR>',                       'search history' },
--   },
--
--   t = {
--     name = "Table Mode",
--     m = { 'toggle' },
--     t = { 'tableize' },
--   },
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  -- ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["b"] = {
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Buffers",
  },
  ["c"] = { "<cmd>Telescope neoclip<CR>", "Clipboard"},
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["f"] = {
    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Find files",
  },
  ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
  ["P"] = { "<cmd>Telescope projects<cr>", "Projects" },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
  -- v = {
  --   name = "CustomScope",
  --   r = {"<Cmd>lua require'telescope'.nvim_config()<CR>", "Open VimRC"},
  --   g = {"<Cmd>lua require'telescope'.grep_prompt()<CR>", "Custom Grep"},
  -- },

  g = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    -- s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
  },

  j = {
    name = "Test",
    f = { "<cmd>TestFile<cr>", "Test File"},
    t = { "<cmd>TestNearest<cr>", "Test Nearest"},
    s = { "<cmd>TestSuite<cr>", "Test Suite"},
    },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
      "<cmd>Telescope diagnostics bufnr=0<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>Telescope diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = {
      "<cmd>lua vim.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    t = { "<cmd>TagbarToggle<CR>", "Tagbar"},
  },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },

  t = {
    name = "Terminal",
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },
}

local wk = require "which-key"
wk.register(mappings, opts)
