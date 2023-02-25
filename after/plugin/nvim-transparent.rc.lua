local status, nvim_transparent = pcall(require, "transparent")
if (not status) then return end

nvim_transparent.setup({
  enable = true,
  extra_groups = 'all',
  -- extra_groups = {},
  exclude = {
    "Visual",
    "VisualNOS",
    "VisualModes",
    "CursorLine",
    "Pmenu",
    "PmenuSel",
    "PmenuSbar",
    "PmenuThumb",
    "WildMenu",
    "FloatBorder",
    "Search",
    "IncSearch",
    "CurSearch",
    "Substitute",
    "lualine_a_normal",
    "lualine_a_insert",
    "lualine_a_visual",
    "lualine_a_command",
    "lualine_a_replace",
    "lualine_a_inactive",
    "lualine_a_terminal",
    "lualine_b_normal",
    "lualine_b_insert",
    "lualine_b_visual",
    "lualine_b_command",
    "lualine_b_replace",
    "lualine_b_inactive",
    "lualine_b_terminal",
  },
  ignore_linked_group = true
})
