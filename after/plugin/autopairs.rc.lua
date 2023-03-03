local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup {
  disable_filetype = { 'TelescopePrompt', 'vim' }
}

local Rule = require('nvim-autopairs.rule')

autopairs.add_rule(Rule("<%", "%>", "eruby"))
