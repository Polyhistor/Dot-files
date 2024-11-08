-- nfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "vscode_dark",
}


M.base46 = {
  hl_override = {
    -- Existing JavaScript/general highlights (keep these)
    ["@property"] = { fg = "#9CDCFE" },
    ["@variable"] = { fg = "#9CDCFE" },
    ["@parameter"] = { fg = "#9CDCFE" },
    ["@function"] = { fg = "#DCDCAA" },
    ["@method"] = { fg = "#DCDCAA" },
    ["@keyword"] = { fg = "#C586C0" },
    ["@string"] = { fg = "#CE9178" },
    ["@number"] = { fg = "#B5CEA8" },
    ["@constant"] = { fg = "#4FC1FF" },
    ["@conditional"] = { fg = "#C586C0" },
    ["@repeat"] = { fg = "#C586C0" },
    ["@exception"] = { fg = "#C586C0" },
    
    -- TypeScript-specific highlights
    ["@type"] = { fg = "#4EC9B0" },  -- Set types to green
    ["@type.builtin"] = { fg = "#4EC9B0" },  -- Built-in types (e.g., string, number)
    ["@type.definition"] = { fg = "#4EC9B0" },  -- Type definitions
    ["@type.qualifier"] = { fg = "#569CD6" },  -- Type qualifiers (e.g., const, readonly)
    
    -- Additional TypeScript-specific nodes
    ["@lsp.type.interface"] = { fg = "#4EC9B0" },
    ["@lsp.type.type"] = { fg = "#4EC9B0" },
    ["@lsp.type.class"] = { fg = "#4EC9B0" },
    ["@lsp.type.enum"] = { fg = "#4EC9B0" },
    
    -- Ensure property identifiers are correct in both JS and TS
    ["@property.identifier"] = { fg = "#9CDCFE" },
    ["@variable.member"] = { fg = "#9CDCFE" },

    -- General syntax elements (keep these)
    Identifier = { fg = "#9CDCFE" },
    Function = { fg = "#DCDCAA" },
    Keyword = { fg = "#C586C0" },
    String = { fg = "#CE9178" },
    Number = { fg = "#B5CEA8" },
    Boolean = { fg = "#569CD6" },
    Constant = { fg = "#4FC1FF" },
    Operator = { fg = "#D4D4D4" },
  },
}

return M

