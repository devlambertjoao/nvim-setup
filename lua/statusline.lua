local setup_highlights = function()
--   local palette = require('nightfox.palette').load("nightfox")
--   local spec = require('nightfox.spec').load("nightfox")
-- 
--   vim.api.nvim_set_hl(0, 'StatusLineNormalMode', { ctermbg = 0, fg = palette.fg2, bg = palette.blue.dim })
--   vim.api.nvim_set_hl(0, 'StatusLineInsertMode', { ctermbg = 0, fg = palette.fg2, bg = palette.orange.dim })
--   vim.api.nvim_set_hl(0, 'StatusLineVisualMode', { ctermbg = 0, fg = palette.fg2, bg = palette.magenta.dim })
--   vim.api.nvim_set_hl(0, 'StatusLineReplaceMode', { ctermbg = 0, fg = palette.fg2, bg = palette.green.dim })
--   vim.api.nvim_set_hl(0, 'StatusLineCmdlineMode', { ctermbg = 0, fg = palette.fg2, bg = palette.pink.dim })
--   vim.api.nvim_set_hl(0, 'StatusLineTerminalMode', { ctermbg = 0, fg = palette.fg2, bg = palette.red.dim })
-- 
--   vim.api.nvim_set_hl(0, 'StatusLineLspError', { ctermbg = 0, fg = palette.red.bright, bg = palette.bg0 })
--   vim.api.nvim_set_hl(0, 'StatusLineLspWarning', { ctermbg = 0, fg = palette.orange.bright, bg = palette.bg0 })
--   vim.api.nvim_set_hl(0, 'StatusLineLspHint', { ctermbg = 0, fg = palette.green.bright, bg = palette.bg0 })
--   vim.api.nvim_set_hl(0, 'StatusLineLspInfo', { ctermbg = 0, fg = palette.blue.bright, bg = palette.bg0 })
-- 
--   vim.api.nvim_set_hl(0, 'StatusLineGitSignsAdd', { ctermbg = 0, fg = spec.git.add, bg = palette.bg2 })
--   vim.api.nvim_set_hl(0, 'StatusLineGitSignsChange', { ctermbg = 0, fg = spec.git.changed, bg = palette.bg2 })
--   vim.api.nvim_set_hl(0, 'StatusLineGitSignsDelete', { ctermbg = 0, fg = spec.git.removed, bg = palette.bg2 })
--   vim.api.nvim_set_hl(0, 'StatusLineGitSignsOnMain', { ctermbg = 0, fg = palette.fg2, bg = palette.bg2 })
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
  local mode_color = "%#Normal#"

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

  return errors .. warnings .. hints .. info
end

local function filetype()
  return string.format(" %s ", vim.bo.filetype):upper()
end

local function lineinfo()
  return " %P %l:%c "
end

Statusline = {}

Statusline.active = function()
  if vim.bo.filetype == 'NvimTree' or
      vim.bo.filetype == 'Telescope' or
      vim.bo.filetype == "alpha" then
    return "%#Normal#"
  end

  setup_highlights()

  return table.concat {
    "%#Statusline#",
    update_mode_colors(),
    mode(),
    versioncontrol(),
    "%#Statusline# ",
    filepath(),
    filename(),
    lsp(),
    "%#Statusline#%=",
    "%#StatuslineNC#",
    filetype(),
    "|",
    lineinfo(),
  }
end

function Statusline.inactive()
  return "%F"
end

function Statusline.short()
  return ""
end

vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)
