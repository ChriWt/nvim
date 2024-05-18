local M = {}

-- Function to set highlight groups
M.setup = function()
  local highlights = {
    { "WinBar", { fg = "#ffffff", bg = "#272f35" } },
    { "WinBarNC", { fg = "#ffffff", bg = "#272f35" } },
    { "NavbuddyCursor", { fg = "#131a21", bg = "#ced4df" } },
    { "NavicIconsFile", { default = true, bg = "#272f35", fg = "#eceff4" } },
    { "NavicIconsModule", { default = true, bg = "#272f35", fg = "#bf616a" } },
    { "NavicIconsNamespace", { default = true, bg = "#272f35", fg = "#d08770" } },
    { "NavicIconsPackage", { default = true, bg = "#272f35", fg = "#ebcb8b" } },
    { "NavicIconsClass", { default = true, bg = "#272f35", fg = "#a3be8c" } },
    { "NavicIconsMethod", { default = true, bg = "#272f35", fg = "#88c0d0" } },
    { "NavicIconsProperty", { default = true, bg = "#272f35", fg = "#b48ead" } },
    { "NavicIconsField", { default = true, bg = "#272f35", fg = "#8fbcbb" } },
    { "NavicIconsConstructor", { default = true, bg = "#272f35", fg = "#d8dee9" } },
    { "NavicIconsEnum", { default = true, bg = "#272f35", fg = "#bf616a" } },
    { "NavicIconsInterface", { default = true, bg = "#272f35", fg = "#d08770" } },
    { "NavicIconsFunction", { default = true, bg = "#272f35", fg = "#ebcb8b" } },
    { "NavicIconsVariable", { default = true, bg = "#272f35", fg = "#a3be8c" } },
    { "NavicIconsConstant", { default = true, bg = "#272f35", fg = "#88c0d0" } },
    { "NavicIconsString", { default = true, bg = "#272f35", fg = "#b48ead" } },
    { "NavicIconsNumber", { default = true, bg = "#272f35", fg = "#8fbcbb" } },
    { "NavicIconsBoolean", { default = true, bg = "#272f35", fg = "#d8dee9" } },
    { "NavicIconsArray", { default = true, bg = "#272f35", fg = "#bf616a" } },
    { "NavicIconsObject", { default = true, bg = "#272f35", fg = "#d08770" } },
    { "NavicIconsKey", { default = true, bg = "#272f35", fg = "#ebcb8b" } },
    { "NavicIconsNull", { default = true, bg = "#272f35", fg = "#a3be8c" } },
    { "NavicIconsEnumMember", { default = true, bg = "#272f35", fg = "#88c0d0" } },
    { "NavicIconsStruct", { default = true, bg = "#272f35", fg = "#b48ead" } },
    { "NavicIconsEvent", { default = true, bg = "#272f35", fg = "#8fbcbb" } },
    { "NavicIconsOperator", { default = true, bg = "#272f35", fg = "#d8dee9" } },
    { "NavicIconsTypeParameter", { default = true, bg = "#272f35", fg = "#bf616a" } },
    { "NavicText", { default = true, bg = "#272f35", fg = "#eceff4" } },
    { "NavicSeparator", { default = true, bg = "#272f35", fg = "#88c0d0" } },
  }

  for _, hl in ipairs(highlights) do
    vim.api.nvim_set_hl(0, hl[1], hl[2])
  end
end

return M
