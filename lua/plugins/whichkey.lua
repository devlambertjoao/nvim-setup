return {
  'folke/which-key.nvim',
  keys = { '<leader>', '<C-w>' },
  cmd = 'WhichKey',
  config = function()
    local whichkey = require('which-key')

    vim.o.timeout = true
    vim.o.timeoutlen = 300

    whichkey.setup({
      icons = {
        breadcrumb = '>',
        separator = '|',
        group = '+',
      },
      window = {
        border = 'none',
        position = 'top',
        margin = { 1, 1, 1, 1 },
        padding = { 1, 1, 1, 1 },
        winbled = 80
      },
      layout = {
        height = { min = 10, max = 60 },
        width = { min = 4, max = 80 },
        spacing = 0,
        align = 'center'
      },
      disable = {
        filetypes = { 'TelescopePrompt' }
      },
      triggers = {"<leader>"}
    })

    whichkey.register({
      f = {
        name = 'File Navigation',
        o = { '<cmd>Oil<CR>', 'Oil' },
        -- b = { '<cmd>NvimTreeFindFileToggle<CR>', 'Nvim Tree' },
        p = { '<cmd>Telescope find_files<CR>', 'Find Files' },
        f = { '<cmd>Telescope live_grep<CR>', 'Grep Files' },
        -- t = { "<cmd>AerialToggle!<CR>", "Tags" },
      },
      c = {
        name = 'Code Actions',
        r = { vim.lsp.buf.rename, 'Rename' },
        a = { vim.lsp.buf.code_action, 'Code Actions' },
        f = { vim.lsp.buf.format, 'Format' },
      },
      d = {
        name = 'Diagnostics',
        a = { '<cmd>Telescope diagnostics<CR>', 'All Workspace Diagnostics' },
        d = { vim.diagnostic.open_float, 'Line Diagnostics' },
        p = { vim.diagnostic.goto_prev, 'Previous Occurence' },
        n = { vim.diagnostic.goto_next, 'Next Occurence' },
        l = { vim.diagnostic.setloclist, 'List File Diagnostics' },
      },
      g = {
        name = 'Code Navigation',
        D = { vim.lsp.buf.declaration, 'Declaration' },
        d = { vim.lsp.buf.definition, 'Definition' },
        i = { vim.lsp.buf.implementation, 'Implementation' },
        r = { vim.lsp.buf.references, 'References' },
        k = { vim.lsp.buf.hover, 'Docs' },
      },
      G = {
        name = 'Git',
        s = { '<cmd>Telescope git_status<CR>', 'Git Status' },
        c = { '<cmd>Telescope git_commits<CR>', 'Git Commits' },
        b = { '<cmd>Telescope git_branches<CR>', 'Git Branches' },
      },
    }, { prefix = '<leader>' })

    -- whichkey.register({ prefix = '<C-w>' })
  end
}
