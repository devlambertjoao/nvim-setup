return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { 'VeryLazy' },
  config = function()
    require('ibl').setup({
      scope = {
        enabled = true
      }
    })
  end
}
