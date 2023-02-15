local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "buffers",
    diagnostics = "nvim_lsp",
    right_mouse_command = "BufferLineTogglePin", -- Pin buffer
    left_mouse_command = "buffer %d", -- Select Buffer
    middle_mouse_command = "bdelete! %d", -- Delete Buffer
    buffer_close_icon = "x",
    tab_size = 24,
    always_show_bufferline = true,
    diagnostics_update_in_insert = true,
    groups = {
      items = {
        require('bufferline.groups').builtin.pinned:with({ icon = "#" })
      },
    },
    separator_style = { '<', '>' },
    indicator = {
      icon = "#",
      style = "none"
    },
    modified_icon = '*',
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true
      }
    },
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = "."
      for e, diagnosticsCount in pairs(diagnostics_dict) do
        local symbol = e == "error" and "e"
            or (e == "warning" and "w")
            or (e == "hint" and "h")
            or (e == "info" and "i")
        s = s .. diagnosticsCount .. symbol
      end

      return s
    end,
  },
})
