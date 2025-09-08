---@type ChadrcConfig
local M = {}

M.ui = {
    theme = 'onedark'
}

M.mappings = require 'custom.mappings'
M.plugins = 'custom.plugins'

require 'custom.options'

return M
