---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'onedark',
  theme_toggle = { "onedark", "one_light" },
  
  statusline = {
    theme = "default",
    separator_style = "default",
  },
  
  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = true,
  },
}

M.plugins = 'custom.plugins'

-- Load custom options
require 'custom.options'

-- Load custom mappings
require 'custom.mappings'

return M
