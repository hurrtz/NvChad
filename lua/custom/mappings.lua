local M = {}

M.abc = {
  i = {
    ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
    ["kj"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }}
  },
  n = {
    [";"] = { ":", "shorthand for command prefix" , opts = { nowait = true }}
  }
}

return M
