return {
  'hrsh7th/nvim-cmp', -- Completition
  config = function()
    local cmp = require('cmp')
    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs( -2),
        ['<C-d>'] = cmp.mapping.scroll_docs(2),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
      }, {
        { name = 'buffer' },
      }),
      window = {
        completion = {
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
          padding = 2,
        },
        documentation = {
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
          padding = 2,
        }
      }
    })

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
  end
}
