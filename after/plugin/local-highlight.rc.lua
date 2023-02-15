local status, local_highlight = pcall(require, "local-highlight")
if (not status) then return end

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
