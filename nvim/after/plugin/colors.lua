function ColorShit(color,style)
  color = color or 'onedark'
  require(color).setup({
    style = style or 'cool', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = true,
  })
 vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, 'Normal', {bg = "none"})
  vim.api.nvim_set_hl(0, 'NormalFloat', {bg = "none"})
end

ColorShit()

