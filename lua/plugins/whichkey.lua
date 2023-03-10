return {
  'folke/which-key.nvim',
  keys = { '<leader>', '<C-w>' },
  config = function()
    local whichkey = require('which-key')

    -- Configure timeout
    vim.o.timeout = true
    vim.o.timeoutlen = 150

    whichkey.setup({
      plugins = {
        marks = false, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 40, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = false, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = false, -- bindings for folds, spelling and others prefixed with z
          g = false, -- bindings for prefixed with g
        },

      },
      operators = { gc = "Comments" },
      key_labels = {},
      icons = {
        breadcrumb = ">", -- symbol used in the command line area that shows your active key combo
        separator = "|", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = '<c-d>', -- binding to scroll down inside the popup
        scroll_up = '<c-u>', -- binding to scroll up inside the popup
      },
      window = {
        border = "none", -- none, single, double, shadow
        position = "top", -- bottom, top
        margin = { 16, 12, 2, 12 }, -- extra window margin [top, right, bottom, left]
        padding = { 4, 4, 4, 4 }, -- extra window padding [top, right, bottom, left]
        winblend = 0
      },
      layout = {
        height = { min = 40, max = 50 }, -- min and max height of the columns
        width = { min = 4, max = 50 }, -- min and max width of the columns
        spacing = 0, -- spacing between columns
        align = "center", -- align columns left, center or right
      },
      ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
      show_help = true, -- show help message on the command line when the popup is visible
      show_keys = true, -- show the currently pressed key and its label as a message in the command line
      triggers = "auto", -- automatically setup triggers
      triggers_blacklist = {
        n = { "d", "g" },
        i = { "j", "k" },
        v = { "j", "k" },
      },
      disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt" },
      }
    })

    -- Normal Mode
    whichkey.register({
      d = {
        name = "Diagnostics",
        a = { "<cmd>Telescope diagnostics<CR>", "All Workspace Diagnostics" },
        d = { vim.diagnostic.open_float, "Line Diagnostics" },
        p = { vim.diagnostic.goto_prev, "Previous Occurence" },
        n = { vim.diagnostic.goto_next, "Next Occurence" },
        l = { vim.diagnostic.setloclist, "List File Diagnostics" },
      },
      g = {
        name = "Code Navigation",
        D = { vim.lsp.buf.declaration, "Declaration" },
        d = { vim.lsp.buf.definition, "Definition" },
        i = { vim.lsp.buf.implementation, "Implementation" },
        r = { vim.lsp.buf.references, "References" },
        k = { vim.lsp.buf.hover, "Docs" },
      },
      c = {
        name = "Code Actions",
        r = { vim.lsp.buf.rename, "Rename" },
        c = { vim.lsp.buf.code_action, "Fix and Suggestions" },
        f = { vim.lsp.buf.format, "Format" },
        j = {'<cmd>lua MiniSplitjoin.toggle()', "Split Join"},
      },
      f = {
        name = "File Navigation",
        p = { "<cmd>Telescope find_files<CR>", "Find Files" },
        f = { "<cmd>Telescope live_grep<CR>", "Grep Files" },
        r = { "<cmd>Telescope oldfiles<CR>", "Recently Closed" },
        b = { "<cmd>NvimTreeFindFileToggle<CR>", "NvimTree" },
      },
      G = {
        name = "Git",
        s = { "<cmd>Telescope git_status<CR>", "Git Status" },
        c = { "<cmd>Telescope git_commits<CR>", "Git Commits" },
        b = { "<cmd>Telescope git_branches<CR>", "Git Branches" },
      },
    }, { prefix = "<leader>" })

    -- Windows
    whichkey.register({ prefix = "<C-w>" })
  end
}
