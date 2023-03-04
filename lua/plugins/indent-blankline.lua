return {
  'lukas-reineke/indent-blankline.nvim',
  event = 'InsertEnter',
  config = function()
    require('indent_blankline').setup({
      show_end_of_line = false,
      space_char_blankline = " ",
      show_current_context = true,
      char = ":"
    })
  end
}
