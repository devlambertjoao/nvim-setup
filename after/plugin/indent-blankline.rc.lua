local status, indent_blankline = pcall(require, "indent_blankline")
if (not status) then return end

indent_blankline.setup({
  show_end_of_line = false,
  space_char_blankline = " ",
  char = "|"
})
