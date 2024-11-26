-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tokyodark",

  transparency = true,
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },

}
M.ui = {
  cmp = {
    icons_left = true,
  },

  statusline = {
    theme = "default",         -- 样式选择：default/vscode/vscode_colored/minimal
    separator_style = "block", -- 分隔符样式选择：default/round/block/arrow
    order = nil,
    modules = nil,
  },
}

M.lsp = {
  signature = true,
}

M.term = {
  winopts = { winhl = "Normal:term,WinSeparator:WinSeparator" },
  sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
  float = {
    relative = "editor",
    row = 0.3,
    col = 0.25,
    width = 0.5,
    height = 0.4,
    border = "single",
  },
}

return M
