local status, noice = pcall(require, "noice")
if (not status) then return end

noice.setup({
  cmdline = {
    format = {
      cmdline = { icon = ">" },
      search_down = { icon = "S⌄" },
      search_up = { icon = "S⌃" },
      filter = { icon = "$" },
      lua = { icon = "Lua: " },
      help = { icon = "Help: " },
    },
  },
  notify = {
    enabled = true,
    view = "notify",
  },
  views = {
    cmdline_popup = {
      border = {
        style = "rounded",
        padding = { 1, 1 },
      },
      filter_options = {},
      win_options = {
        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
      },
    },
    mini = {
      position = {
        row = -1
      }
    },
  },
  format = {
    level = {
      hl_group = {
        trace = "NoiceFormatLevelTrace",
        debug = "NoiceFormatLevelDebug",
        info = "NoiceFormatLevelInfo",
        warn = "NoiceFormatLevelWarn",
        error = "NoiceFormatLevelError",
        off = "NoiceFormatLevelOff",
      },
      icons = { error = "E", warn = "W", info = "I" },
    },
  }
})

require("notify").setup({
  background_colour = "#000000",
  render = "minimal",
})
