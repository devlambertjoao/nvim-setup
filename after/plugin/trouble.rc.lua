local status, trouble = pcall(require, "trouble")
if (not status) then return end

trouble.setup({
  icons = false,
  fold_open = "v",
  fold_closed = ">",
  indent_lines = false,
  auto_open = true,
  auto_close = true,
  auto_preview = true,
  signs = {
    error = "error",
    warning = "warn",
    hint = "hint",
    information = "info"
  },
  use_diagnostic_signs = false
})
