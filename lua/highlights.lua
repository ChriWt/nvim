local M = {}

local winbar_background = "#272f35"

-- Function to set highlight groups
M.setup = function()
  local highlights = {
    -- winbar navic configuration
    { "WinBar",                   {                 bg = winbar_background, fg = "#ffffff" } },
    { "WinBarNC",                 {                 bg = winbar_background, fg = "#ffffff" } },

    -- dap bar configuration
    { "DapUIPlayPauseNC",         {                 bg = winbar_background, fg = "#a9ff68" } },
    { "DapUIRestartNC",           {                 bg = winbar_background, fg = "#a9ff68" } },
    { "DAPUIStopNC",              {                 bg = winbar_background, fg = "#f70067" } },
    { "DAPUIUnavailableNC",       {                 bg = winbar_background, fg = "#424242" } },
    { "DapUIStepOverNC",          {                 bg = winbar_background, fg = "#00f1f5" } },
    { "DapUIStepIntoNC",          {                 bg = winbar_background, fg = "#00f1f5" } },
    { "DapUIStepBackNC",          {                 bg = winbar_background, fg = "#00f1f5" } },
    { "DapUIStepOutNC",           {                 bg = winbar_background, fg = "#00f1f5" } },

    -- navbuddy cursor configuration
    { "NavbuddyCursor",           {                 bg = "#ced4df",         fg = "#131a21" } },

    -- navbar icon configuration
    { "NavicIconsFile",           { default = true, bg = winbar_background, fg = "#eceff4" } },
    { "NavicIconsModule",         { default = true, bg = winbar_background, fg = "#bf616a" } },
    { "NavicIconsNamespace",      { default = true, bg = winbar_background, fg = "#d08770" } },
    { "NavicIconsPackage",        { default = true, bg = winbar_background, fg = "#ebcb8b" } },
    { "NavicIconsClass",          { default = true, bg = winbar_background, fg = "#a3be8c" } },
    { "NavicIconsMethod",         { default = true, bg = winbar_background, fg = "#88c0d0" } },
    { "NavicIconsProperty",       { default = true, bg = winbar_background, fg = "#b48ead" } },
    { "NavicIconsField",          { default = true, bg = winbar_background, fg = "#8fbcbb" } },
    { "NavicIconsConstructor",    { default = true, bg = winbar_background, fg = "#d8dee9" } },
    { "NavicIconsEnum",           { default = true, bg = winbar_background, fg = "#bf616a" } },
    { "NavicIconsInterface",      { default = true, bg = winbar_background, fg = "#d08770" } },
    { "NavicIconsFunction",       { default = true, bg = winbar_background, fg = "#ebcb8b" } },
    { "NavicIconsVariable",       { default = true, bg = winbar_background, fg = "#a3be8c" } },
    { "NavicIconsConstant",       { default = true, bg = winbar_background, fg = "#88c0d0" } },
    { "NavicIconsString",         { default = true, bg = winbar_background, fg = "#b48ead" } },
    { "NavicIconsNumber",         { default = true, bg = winbar_background, fg = "#8fbcbb" } },
    { "NavicIconsBoolean",        { default = true, bg = winbar_background, fg = "#d8dee9" } },
    { "NavicIconsArray",          { default = true, bg = winbar_background, fg = "#bf616a" } },
    { "NavicIconsObject",         { default = true, bg = winbar_background, fg = "#d08770" } },
    { "NavicIconsKey",            { default = true, bg = winbar_background, fg = "#ebcb8b" } },
    { "NavicIconsNull",           { default = true, bg = winbar_background, fg = "#a3be8c" } },
    { "NavicIconsEnumMember",     { default = true, bg = winbar_background, fg = "#88c0d0" } },
    { "NavicIconsStruct",         { default = true, bg = winbar_background, fg = "#b48ead" } },
    { "NavicIconsEvent",          { default = true, bg = winbar_background, fg = "#8fbcbb" } },
    { "NavicIconsOperator",       { default = true, bg = winbar_background, fg = "#d8dee9" } },
    { "NavicIconsTypeParameter",  { default = true, bg = winbar_background, fg = "#bf616a" } },
    { "NavicText",                { default = true, bg = winbar_background, fg = "#eceff4" } },
    { "NavicSeparator",           { default = true, bg = winbar_background, fg = "#88c0d0" } },
  }

  for _, hl in ipairs(highlights) do
    vim.api.nvim_set_hl(0, hl[1], hl[2])
  end
end

return M
