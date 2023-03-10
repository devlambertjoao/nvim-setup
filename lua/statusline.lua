local setup_highlights = function()
  local palette = {
    base00 = '#1e1e2e',
    base01 = '#181825',
    base02 = '#313244',
    base03 = '#45475a',
    base04 = '#585b70',
    base05 = '#cdd6f4',
    base06 = '#f5e0dc',
    base07 = '#b4befe',
    base08 = '#f38ba8',
    base09 = '#fab387',
    base0A = '#f9e2af',
    base0B = '#a6e3a1',
    base0C = '#94e2d5',
    base0D = '#89b4fa',
    base0E = '#cba6f7',
    base0F = '#f2cdcd'
  }
  vim.api.nvim_set_hl(0, 'StatusLineNormalMode', { ctermbg = 0, fg = palette.base01, bg = palette.base07 })
  vim.api.nvim_set_hl(0, 'StatusLineInsertMode', { ctermbg = 0, fg = palette.base01, bg = palette.base0A })
  vim.api.nvim_set_hl(0, 'StatusLineVisualMode', { ctermbg = 0, fg = palette.base01, bg = palette.base0E })
  vim.api.nvim_set_hl(0, 'StatusLineReplaceMode', { ctermbg = 0, fg = palette.base01, bg = palette.base0B })
  vim.api.nvim_set_hl(0, 'StatusLineCmdlineMode', { ctermbg = 0, fg = palette.base01, bg = palette.base0F })
  vim.api.nvim_set_hl(0, 'StatusLineTerminalMode', { ctermbg = 0, fg = palette.base01, bg = palette.base08 })

  vim.api.nvim_set_hl(0, 'StatusLineGitSignsAdd', { ctermbg = 0, fg = palette.base0B, bg = palette.base01 })
  vim.api.nvim_set_hl(0, 'StatusLineGitSignsChange', { ctermbg = 0, fg = palette.base0E, bg = palette.base01 })
  vim.api.nvim_set_hl(0, 'StatusLineGitSignsDelete', { ctermbg = 0, fg = palette.base08, bg = palette.base01 })
  vim.api.nvim_set_hl(0, 'StatusLineGitSignsOnMain', { ctermbg = 0, fg = palette.base05, bg = palette.base01 })

  vim.api.nvim_set_hl(0, 'StatusLineLspError', { ctermbg = 0, fg = palette.base08, bg = palette.base01 })
  vim.api.nvim_set_hl(0, 'StatusLineLspWarning', { ctermbg = 0, fg = palette.base0A, bg = palette.base01 })
  vim.api.nvim_set_hl(0, 'StatusLineLspHint', { ctermbg = 0, fg = palette.base0B, bg = palette.base01 })
  vim.api.nvim_set_hl(0, 'StatusLineLspInfo', { ctermbg = 0, fg = palette.base0D, bg = palette.base01 })

  vim.api.nvim_set_hl(0, 'StatusLineNormal', { ctermbg = 0, fg = palette.base09, bg = palette.base02 })
  vim.api.nvim_set_hl(0, 'StatuslineNC', { ctermbg = 0, fg = palette.base05, bg = palette.base01 })
  vim.api.nvim_set_hl(0, 'StatuslineInactive', { ctermbg = 0, fg = palette.base05, bg = palette.base01 })
end

local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  [""] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  [""] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format("  %s  ", modes[current_mode]):upper()
end

local function update_mode_colors()
  local current_mode = vim.api.nvim_get_mode().mode
  local mode_color = "%#StatusLineNormal#"

  if current_mode == "n" then
    mode_color = "%#StatusLineNormalMode#"
  elseif current_mode == "i" or current_mode == "ic" then
    mode_color = "%#StatusLineInsertMode#"
  elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
    mode_color = "%#StatusLineVisualMode#"
  elseif current_mode == "R" then
    mode_color = "%#StatusLineReplaceMode#"
  elseif current_mode == "c" then
    mode_color = "%#StatusLineCmdLineMode#"
  elseif current_mode == "t" then
    mode_color = "%#StatusLineTerminalMode#"
  end

  return mode_color
end

local versioncontrol = function()
  local git_info = vim.b.gitsigns_status_dict
  if not git_info or git_info.head == "" then
    return ""
  end

  local added = git_info.added and ("%#StatusLineGitSignsAdd#+" .. git_info.added .. " ") or ""
  local changed = git_info.changed and ("%#StatusLineGitSignsChange#~" .. git_info.changed .. " ") or ""
  local removed = git_info.removed and ("%#StatusLineGitSignsDelete#-" .. git_info.removed .. " ") or ""

  if git_info.added == 0 then
    added = ""
  end
  if git_info.changed == 0 then
    changed = ""
  end
  if git_info.removed == 0 then
    removed = ""
  end

  return table.concat {
    "%#StatusLineGitSignsAdd# ",
    added,
    changed,
    removed,
    "%#StatusLineGitSignsOnMain#on ",
    git_info.head,
    " "
  }
end

local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
  if fpath == "" or fpath == "." then
    return " "
  end

  return string.format("%%<%s/", fpath)
end

local function filename()
  local fname = vim.fn.expand "%:t"
  if fname == "" then
    return ""
  end
  return fname .. " "
end

local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""

  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = "%#StatusLineLspError# e" .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = "%#StatusLineLspWarning# w" .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = "%#StatusLineLspHint# h" .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = "%#StatusLineLspInfo# i" .. count["info"]
  end

  local lsp_label = errors .. warnings .. hints .. info
  if lsp_label == '' then
    return ''
  end

  return lsp_label .. "%#StatuslineNC# |"
end

local function filetype()
  if vim.bo.filetype == '' then
    return ''
  end

  return string.format(" %s |", vim.bo.filetype)
end

local function lineinfo()
  if vim.bo.filetype == '' then
    return ''
  end

  return " %p%% %l:%c "
end

Statusline = {}

Statusline.active = function()
  if vim.bo.filetype == 'NvimTree' or
      vim.bo.filetype == 'Telescope' or
      vim.bo.filetype == "alpha" then
    return "%#StatusLineNormal#"
  end

  setup_highlights()

  return table.concat {
    update_mode_colors(),
    mode(),
    versioncontrol(),
    "%#StatusLineNormal# ",
    filepath(),
    filename(),
    "%#StatuslineNormal#%=",
    lsp(),
    "%#StatuslineNC#",
    filetype(),
    lineinfo(),
  }
end

function Statusline.inactive()
  return "%#StatusLineNormal# %F"
end

function Statusline.short()
  return "%#StatusLineInactive#"
end

vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)
