return {
  'tzachar/local-highlight.nvim',
  event = { 'InsertEnter' },
  config = function()
    local local_highlight = require('local-highlight')

    local_highlight.setup({
      file_types = { 'json', 'cpp' },
      hlgroup = 'Search',
    })

    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = { '*.*' },
      callback = function(data)
        local_highlight.attach(data.buf)
      end
    })
  end
}
