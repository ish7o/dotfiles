local M = {}

---@class Highlight
---@field fg string|nil
---@field bg string|nil
---@field sp string|nil
---@field style string|nil|table
---@field link string|nil

---@alias Highlights table<string,Highlight>

local colors = {
    bg = "#1a1625",          -- Deep night purple-black
    fg = "#f8f8f2",         -- Soft white
    gray = "#6272a4",       -- Muted blue-purple
    blue = "#bd93f9",       -- Dreamy purple-blue
    green = "#50fa7b",      -- Night city green
    purple = "#ff92df",     -- Bright pink (our statement color!)
    red = "#ff5555",        -- Warning red
    orange = "#ffb86c",     -- Warm accent
    yellow = "#f1fa8c",     -- Soft yellow
    cyan = "#8be9fd",       -- Cyberpunk-ish cyan
    bg_dark = "#13111c",    -- Darker background
    bg_lighter = "#2a2438", -- Subtle highlight
    fg_dark = "#e2e2e2",    -- Slightly darker white
    pink = "#ff79c6",       -- Our main pink!
    soft_pink = "#d967bb",  -- Muted pink for regular use
}

local function highlight(group, color)
    local style = color.style and "gui=" .. color.style or "gui=NONE"
    local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
    local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
    local sp = color.sp and "guisp=" .. color.sp or ""

    local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp

    vim.cmd(hl)
    if color.link then
        vim.cmd("highlight! link " .. group .. " " .. color.link)
    end
end

function M.load()
    -- Reset colors
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end

    vim.o.background = "dark"
    vim.g.colors_name = "night-3am"

    vim.opt.termguicolors = true
    vim.opt.winblend = 50
    vim.opt.pumblend = 50

    local syntax = {
        -- Syntax groups
        Normal = { fg = colors.fg, bg = colors.bg },
        Comment = { fg = colors.gray, style = "italic" },
        Constant = { fg = colors.soft_pink },
        String = { fg = colors.yellow },
        Character = { fg = colors.green },
        Number = { fg = colors.purple },
        Boolean = { fg = colors.purple },
        Float = { fg = colors.purple },
        Identifier = { fg = colors.soft_pink },
        Function = { fg = colors.pink },
        Statement = { fg = colors.purple },
        Conditional = { fg = colors.purple },
        Repeat = { fg = colors.purple },
        Label = { fg = colors.purple },
        Operator = { fg = colors.pink },
        Keyword = { fg = colors.purple },
        Exception = { fg = colors.purple },

        -- UI highlighting
        ColorColumn = { bg = colors.bg_dark },
        Cursor = { fg = colors.bg, bg = colors.fg },
        CursorLine = { bg = colors.bg_lighter },
        LineNr = { fg = colors.gray },
        CursorLineNr = { fg = colors.pink },
        Directory = { fg = colors.blue },
        DiffAdd = { fg = colors.green },
        DiffChange = { fg = colors.yellow },
        DiffDelete = { fg = colors.red },
        DiffText = { fg = colors.blue },
        EndOfBuffer = { fg = colors.bg },
        ErrorMsg = { fg = colors.red },
        VertSplit = { fg = colors.bg_lighter },
        Folded = { fg = colors.gray },
        FoldColumn = { fg = colors.gray },
        SignColumn = { fg = colors.bg },
        IncSearch = { fg = colors.bg, bg = colors.pink },
        Search = { fg = colors.bg, bg = colors.purple },
        MatchParen = { fg = colors.cyan, style = "bold" },
        NonText = { fg = colors.gray },
        Pmenu = { fg = colors.fg, bg = colors.bg_dark },
        PmenuSel = { fg = colors.bg, bg = colors.pink },
        Question = { fg = colors.purple },
        SpecialKey = { fg = colors.gray },
        StatusLine = { fg = colors.fg, bg = colors.bg_dark },
        StatusLineNC = { fg = colors.gray, bg = colors.bg_dark },
        Title = { fg = colors.pink, style = "bold" },
        Visual = { bg = colors.bg_lighter },
        WarningMsg = { fg = colors.orange },
        Whitespace = { fg = colors.gray },
    }

    -- Set syntax highlights
    for group, colors in pairs(syntax) do
        highlight(group, colors)
    end
end

M.load()
return M


--local M = {}

-----@class Highlight
-----@field fg string|nil
-----@field bg string|nil
-----@field sp string|nil
-----@field style string|nil|table
-----@field link string|nil

-----@alias Highlights table<string,Highlight>

--local colors = {
--    bg = "NONE",
--    fg = "#f2e8f0", -- hsl(315, 28%, 93%)
--    gray = "#726172",
--    blue = "#8583c4",
--    green = "#83c4a6",
--    purple = "#a683c4",
--    red = "#c48583",
--    orange = "#c483c2",
--    yellow = "#c2c483",
--    cyan = "#83c2c4",
--    bg_dark = "#444444",
--    bg_lighter = "#565656",
--    fg_dark = "#777777",
--}

--local function highlight(group, color)
--    local style = color.style and "gui=" .. color.style or "gui=NONE"
--    local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
--    local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
--    local sp = color.sp and "guisp=" .. color.sp or ""

--    local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp

--    vim.cmd(hl)
--    if color.link then
--        vim.cmd("highlight! link " .. group .. " " .. color.link)
--    end
--end

--function M.load()
--    -- Reset colors
--    if vim.fn.exists("syntax_on") then
--        vim.cmd("syntax reset")
--    end

--    vim.o.background = "dark"
--    vim.g.colors_name = "night-3am"

--    vim.opt.termguicolors = true
--    vim.opt.winblend = 50
--    vim.opt.pumblend = 50

--    local syntax = {
--        -- Syntax groups
--        Normal = { fg = colors.fg, bg = colors.bg },
--        Comment = { fg = colors.gray, style = "italic" },
--        Constant = { fg = colors.orange },
--        String = { fg = colors.green },
--        Character = { fg = colors.green },
--        Number = { fg = colors.orange },
--        Boolean = { fg = colors.orange },
--        Float = { fg = colors.orange },
--        Identifier = { fg = colors.blue },
--        Function = { fg = colors.blue },
--        Statement = { fg = colors.purple },
--        Conditional = { fg = colors.purple },
--        Repeat = { fg = colors.purple },
--        Label = { fg = colors.purple },
--        Operator = { fg = colors.purple },
--        Keyword = { fg = colors.purple },
--        Exception = { fg = colors.purple },

--        -- UI highlighting
--        ColorColumn = { bg = colors.bg_dark },
--        Cursor = { fg = colors.bg, bg = colors.fg },
--        CursorLine = { bg = colors.bg_lighter },
--        LineNr = { fg = colors.gray },
--        CursorLineNr = { fg = colors.yellow },
--        Directory = { fg = colors.blue },
--        DiffAdd = { fg = colors.green },
--        DiffChange = { fg = colors.yellow },
--        DiffDelete = { fg = colors.red },
--        DiffText = { fg = colors.blue },
--        EndOfBuffer = { fg = colors.bg },
--        ErrorMsg = { fg = colors.red },
--        VertSplit = { fg = colors.bg_lighter },
--        Folded = { fg = colors.gray },
--        FoldColumn = { fg = colors.gray },
--        SignColumn = { fg = colors.bg },
--        IncSearch = { fg = colors.bg, bg = colors.orange },
--        Search = { fg = colors.bg, bg = colors.yellow },
--        MatchParen = { fg = colors.cyan, style = "bold" },
--        NonText = { fg = colors.gray },
--        Pmenu = { fg = colors.fg, bg = colors.bg_dark },
--        PmenuSel = { fg = colors.bg, bg = colors.blue },
--        Question = { fg = colors.purple },
--        SpecialKey = { fg = colors.gray },
--        StatusLine = { fg = colors.fg, bg = colors.bg_dark },
--        StatusLineNC = { fg = colors.gray, bg = colors.bg_dark },
--        Title = { fg = colors.blue, style = "bold" },
--        Visual = { bg = colors.bg_lighter },
--        WarningMsg = { fg = colors.yellow },
--        Whitespace = { fg = colors.gray },
--    }

--    -- Set syntax highlights
--    for group, colors in pairs(syntax) do
--        highlight(group, colors)
--    end
--end

--M.load()
--return M
