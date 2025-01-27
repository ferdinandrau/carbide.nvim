local Config = require("carbide.config")
local Palette = require("carbide.palette")

local M = {}

---@param colors carbide.Colors
---@return carbide.Scheme
local function fill_default_scheme(colors)
    local config = Config.get()
    local style = config.style
    local plugins = config.plugins

    local solid = style.gutter == "solid" or style.gutter == "solid_extended"
    local extended = style.gutter == "editor_extended" or style.gutter == "solid_extended"

    local none = "NONE"
    local gutter_bg = solid and colors.bg3 or (style.transparent and none or colors.bg1)
    local culhl_bg = solid and (extended and colors.bg4 or colors.bg3)
        or (style.transparent and none or (extended and colors.bg4 or colors.bg1))

    return vim.tbl_extend(
        "error",

        --------------
        -- Built-in --
        --------------

        {
            -- :help highlight-groups

            Normal = { fg = colors.fg1, bg = style.transparent and none or colors.bg1 },
            NormalNC = { link = "Normal" },
            NormalFloat = { fg = colors.fg1, bg = colors.bg2 },

            WinSeparator = { fg = colors.fg4 },
            FloatBorder = { fg = colors.fg4, bg = colors.bg2 },

            Title = { fg = colors.fg1, bold = true },
            FloatTitle = { fg = colors.fg1, bg = colors.bg2, bold = true },

            CursorLine = { bg = colors.bg4 },
            CursorColumn = { link = "CursorLine" },

            LineNr = { fg = colors.fg4, bg = gutter_bg },
            LineNrAbove = { link = "LineNr" },
            LineNrBelow = { link = "LineNr" },
            CursorLineNr = { fg = colors.fg3, bg = culhl_bg, bold = true },
            SignColumn = { bg = gutter_bg },
            CursorLineSign = { bg = culhl_bg },
            FoldColumn = { link = "SignColumn" },
            CursorLineFold = { link = "CursorLineSign" },

            WinBar = { fg = colors.fgu2, bg = colors.bg3 },
            WinBarNC = { fg = colors.fgu3, bg = colors.bg3 },

            StatusLine = { fg = colors.fg1, bg = colors.bg5 },
            StatusLineNC = { fg = colors.fg3, bg = colors.bg5 },
            TabLine = { fg = colors.fg1, bg = colors.bg5 },
            TabLineFill = { link = "TabLine" },
            TabLineSel = { bg = colors.bg1, bold = true },

            Visual = { fg = colors.fg1, bg = colors.bg8 },
            VisualNOS = { link = "Visual" },
            Search = { fg = colors.fg1, bg = colors.bgc_yellow },
            IncSearch = { link = "Search" },
            CurSearch = { fg = colors.fg1, bg = colors.bgc_cyan },
            Substitute = { fg = colors.fg1, bg = colors.bgc_blue },

            Pmenu = { bg = colors.bg6 },
            PmenuSel = { bg = colors.bg7 },
            PmenuExtra = { fg = colors.fg3 },
            PmenuExtraSel = { fg = colors.fg3 },
            PmenuKind = { fg = colors.fgc_blue_dim },
            PmenuKindSel = { link = "PmenuKind" },
            PmenuSbar = { fg = colors.bg6, bg = colors.bg6 },
            PmenuThumb = { fg = colors.fg3, bg = colors.fg3 },

            Cursor = { fg = colors.bg1, bg = colors.fg1 },
            lCursor = { link = "Cursor" },
            CursorIM = { link = "Cursor" },
            TermCursor = { link = "Cursor" },
            TermCursorNC = { link = "Cursor" }, -- deprecated in Neovim 0.11

            WildMenu = { link = "NormalFloat" },
            ErrorMsg = { fg = colors.fgc_red },
            WarningMsg = { fg = colors.fgc_yellow },
            MsgArea = { fg = colors.fg1 },
            MsgSeparator = { link = "StatusLine" },
            MoreMsg = { fg = colors.fgc_cyan },
            ModeMsg = { fg = colors.fg1 },

            ColorColumn = { bg = colors.red_dim },
            QuickFixLine = { bg = colors.blue_dim },

            Conceal = { fg = colors.fg4 },

            Directory = { fg = colors.fgc_blue },

            Folded = { fg = colors.fg1, bg = colors.bgc_cyan },
            MatchParen = { bg = colors.bg4 },

            NonText = { fg = colors.fg5 },
            Whitespace = { link = "NonText" },
            EndOfBuffer = { link = "NonText" },

            Question = { link = "MoreMsg" },

            SnippetTabstop = { fg = colors.fg1, bg = colors.bg7 },
            SpecialKey = { link = "Whitespace" },

            SpellBad = { fg = colors.fgc_red },
            SpellCap = { fg = colors.fgc_blue },
            SpellLocal = { fg = colors.fgc_yellow },
            SpellRare = { fg = colors.fgc_yellow },

            DiffAdd = { bg = colors.green },
            DiffChange = { bg = colors.magenta },
            DiffDelete = { bg = colors.red },
            DiffText = { bg = colors.blue },

            -- :help group-name

            Added = { fg = colors.fgc_green },
            Changed = { fg = colors.fgc_magenta },
            Removed = { fg = colors.fgc_red },

            PreProc = { link = "Keyword" },
            PreCondit = { link = "PreProc" },
            Macro = { link = "PreProc" },
            Include = { link = "PreProc" },
            Define = { link = "PreProc" },

            Keyword = { fg = colors.fgc_magenta, bold = style.keywords.bold, italic = style.keywords.italic },
            Statement = { link = "Keyword" },
            Conditional = { link = "Keyword" },
            Label = { link = "Keyword" },
            Repeat = { link = "Keyword" },
            Exception = { link = "Keyword" },

            Operator = { fg = colors.fgc_red_dim },

            Number = { fg = colors.fgc_cyan },
            Float = { link = "Number" },
            Boolean = { link = "Number" },

            String = { fg = colors.fgc_green, bold = style.strings.bold, italic = style.strings.italic },
            Character = { link = "String" },
            SpecialChar = { fg = colors.fgc_cyan_dim, bold = style.strings.bold, italic = style.strings.italic },

            Debug = { link = "Special" },
            Error = { bg = colors.fgc_red },

            Function = { fg = colors.fgc_blue_dim },

            Identifier = { fg = colors.fg1, bold = style.variables.bold, italic = style.variables.italic },
            Constant = { fg = colors.fgc_yellow_dim, bold = style.variables.bold, italic = style.variables.italic },
            Delimiter = { fg = colors.fg6 },
            Comment = { fg = colors.fg2, bold = style.comments.bold, italic = style.comments.italic },
            Ignore = { fg = colors.fg5 },
            Underlined = { underline = true },
            Todo = { fg = colors.fgc_red, bold = true },
            Special = { fg = colors.fgc_yellow },
            SpecialComment = { link = "Special" },
            Tag = { link = "Special" },

            Type = { fg = colors.fgc_yellow },
            Typedef = { link = "Type" },
            StorageClass = { link = "Type" },
            Structure = { link = "Type" },

            -- :help treesitter-highlight-groups

            ["@variable"] = { link = "Identifier" },
            ["@variable.builtin"] = { link = "Identifier" },
            ["@variable.parameter"] = { link = "Identifier" },
            ["@variable.parameter.builtin"] = { link = "Identifier" },
            ["@variable.member"] = { link = "Identifier" },

            ["@constant"] = { link = "Constant" },
            ["@constant.builtin"] = { link = "Constant" },
            ["@constant.macro"] = { link = "Constant" },

            ["@module"] = { fg = colors.fgc_red },
            ["@module.builtin"] = { link = "@module" },

            ["@label"] = { link = "Label" },

            ["@string"] = { link = "String" },
            ["@string.documentation"] = { fg = colors.fgc_green_dim },
            ["@string.regexp"] = { fg = colors.fgc_red_dim },
            ["@string.escape"] = { link = "SpecialChar" },
            ["@string.special"] = { link = "SpecialChar" },
            ["@string.special.symbol"] = { link = "String" },
            ["@string.special.path"] = { link = "SpecialChar" },
            ["@string.special.url"] = { link = "@markup.link" },

            ["@character"] = { link = "Character" },
            ["@character.special"] = { link = "SpecialChar" },
            ["@character.printf"] = { link = "SpecialChar" },

            ["@boolean"] = { link = "Boolean" },

            ["@number"] = { link = "Number" },
            ["@number.float"] = { link = "Number" },

            ["@type"] = { link = "Type" },
            ["@type.builtin"] = { link = "Type" },
            ["@type.definition"] = { link = "Type" },

            ["@attribute"] = { fg = colors.fgc_green_dim },
            ["@attribute.builtin"] = { link = "@attribute" },

            ["@property"] = { link = "@variable.member" },

            ["@function"] = { link = "Function" },
            ["@function.macro"] = { fg = colors.fgc_blue },
            ["@function.builtin"] = { link = "Keyword" },

            ["@constructor"] = { fg = colors.fgc_blue },
            ["@constructor.lua"] = { fg = colors.fg6 },

            ["@operator"] = { link = "Operator" },

            ["@keyword"] = { link = "Keyword" },
            ["@keyword.operator"] = { link = "Operator" },
            ["@keyword.directive"] = { fg = colors.fgc_magenta_dim },
            ["@keyword.import.c"] = { fg = colors.fgc_magenta_dim },

            ["@punctuation.delimiter"] = { link = "Delimiter" },
            ["@punctuation.bracket"] = { link = "Delimiter" },
            ["@punctuation.special"] = { fg = colors.fgc_magenta_dim },

            ["@comment"] = { link = "Comment" },
            ["@comment.documentation"] = { fg = colors.fg4, bold = style.comments.bold, italic = false },
            ["@comment.error"] = { link = "DiagnosticError" },
            ["@comment.warning"] = { link = "DiagnosticWarn" },
            ["@comment.todo"] = { link = "Todo" },
            ["@comment.note"] = { fg = colors.fgc_cyan },

            ["@markup.strong"] = { bold = true },
            ["@markup.italic"] = { italic = true },
            ["@markup.strikethrough"] = { strikethrough = true },
            ["@markup.underline"] = { link = "Underlined" },
            ["@markup.heading"] = { fg = colors.fgc_yellow, bold = true },
            ["@markup.quote"] = { fg = colors.fgc_red },
            ["@markup.math"] = { fg = colors.fgc_cyan },
            ["@markup.link"] = { fg = colors.fgc_blue_dim },
            ["@markup.link.label"] = { fg = colors.fgc_cyan_dim },
            ["@markup.link.url"] = { fg = colors.fgc_yellow_dim, underline = true },
            ["@markup.raw"] = { fg = colors.fg3 },
            ["@markup.raw.block"] = { link = "@markup.raw" },
            ["@markup.list"] = { link = "Special" },
            ["@markup.list.checked"] = { fg = colors.fgc_green },
            ["@markup.list.unchecked"] = { fg = colors.fg3 },

            ["@diff.plus"] = { link = "Added" },
            ["@diff.minus"] = { link = "Removed" },
            ["@diff.delta"] = { link = "Changed" },

            ["@tag"] = { fg = colors.fgc_magenta },
            ["@tag.builtin"] = { fg = colors.fgc_magenta },
            ["@tag.attribute"] = { fg = colors.fgc_cyan },
            ["@tag.delimiter"] = { link = "Delimiter" },

            -- :help diagnostic-highlights

            DiagnosticError = { fg = colors.fgc_red },
            DiagnosticWarn = { fg = colors.fgc_yellow },
            DiagnosticInfo = { fg = colors.fgc_blue },
            DiagnosticHint = { fg = colors.fgc_magenta },
            DiagnosticOk = { fg = colors.fgc_green },
            DiagnosticUnnecessary = { fg = colors.fg3 },
            DiagnosticDeprecated = { sp = colors.fgc_yellow, strikethrough = true },
            DiagnosticSignError = { fg = colors.fgc_red, bg = gutter_bg },
            DiagnosticSignWarn = { fg = colors.fgc_yellow, bg = gutter_bg },
            DiagnosticSignInfo = { fg = colors.fgc_blue, bg = gutter_bg },
            DiagnosticSignHint = { fg = colors.fgc_magenta, bg = gutter_bg },
            DiagnosticSignOk = { fg = colors.fgc_green, bg = gutter_bg },
            DiagnosticVirtualTextError = { fg = colors.fgc_red, bg = colors.bgc_red },
            DiagnosticVirtualTextWarn = { fg = colors.fgc_yellow, bg = colors.bgc_yellow },
            DiagnosticVirtualTextInfo = { fg = colors.fgc_blue, bg = colors.bgc_blue },
            DiagnosticVirtualTextHint = { fg = colors.fgc_magenta, bg = colors.bgc_magenta },
            DiagnosticVirtualTextOK = { fg = colors.fgc_green, bg = colors.bgc_green },
            DiagnosticUnderlineError = { sp = colors.fgc_red, undercurl = true },
            DiagnosticUnderlineWarn = { sp = colors.fgc_yellow, undercurl = true },
            DiagnosticUnderlineInfo = { sp = colors.fgc_blue, underline = true },
            DiagnosticUnderlineHint = { sp = colors.fgc_magenta, underline = true },
            DiagnosticUnderlineOk = { sp = colors.fgc_green, underline = true },

            -- :help lsp-highlight

            LspReferenceText = { bg = colors.bg5 },
            LspReferenceRead = { link = "LspReferenceText" },
            LspReferenceWrite = { link = "LspReferenceText" },
            LspInlayHint = { link = "Conceal" },

            -- undocumented groups
            -- custom groups
        },

        -------------
        -- Plugins --
        -------------

        -- https://github.com/folke/lazy.nvim
        plugins["lazy.nvim"]
                and {
                    LazyBold = { bold = true },
                    LazyButton = { bg = colors.bg3 },
                    LazyButtonActive = { fg = colors.fg1, bg = colors.bg8 },
                    LazyComment = { fg = colors.fg3 },
                    LazyCommit = { fg = colors.fg4 },
                    LazyCommitIssue = { link = "@markup.link" },
                    LazyCommitScope = { fg = colors.fg3, bold = true },
                    LazyCommitType = { fg = colors.fg4, bold = true },
                    LazyDimmed = { fg = colors.fg4 },
                    LazyDir = { link = "Directory" },
                    LazyError = { link = "DiagnosticError" },
                    LazyH1 = { link = "LazyButtonActive" },
                    LazyH2 = { link = "Title" },
                    LazyInfo = { link = "DiagnosticInfo" },
                    LazyItalic = { italic = true },
                    LazyLocal = { fg = colors.red_dim },
                    LazyNoCond = { link = "DiagnosticWarn" },
                    LazyNormal = { link = "NormalFloat" },
                    LazyProgressDone = { fg = colors.fgc_red_dim },
                    LazyProgressTodo = { fg = colors.fgc_yellow_dim },
                    LazyProp = { link = "LazyComment" },
                    LazyReasonCmd = { fg = colors.fgc_magenta },
                    LazyReasonEvent = { link = "LazyReasonCmd" },
                    LazyReasonFt = { link = "LazyReasonCmd" },
                    LazyReasonImport = { link = "LazyReasonCmd" },
                    LazyReasonKeys = { link = "LazyReasonCmd" },
                    LazyReasonPlugin = { link = "LazyReasonCmd" },
                    LazyReasonRequire = { link = "LazyReasonCmd" },
                    LazyReasonRuntime = { link = "LazyReasonCmd" },
                    LazyReasonSource = { link = "LazyReasonCmd" },
                    LazyReasonStart = { link = "LazyReasonCmd" },
                    LazySpecial = { link = "Special" },
                    LazyTaskOutput = { fg = colors.fgc_blue },
                    LazyUrl = { link = "@markup.link" },
                    LazyValue = { link = "Operator" },
                    LazyWarning = { link = "DiagnosticWarn" },
                }
            or {},

        -- https://github.com/williamboman/mason.nvim
        plugins["mason.nvim"]
                and {
                    MasonHeader = { link = "Title" },
                    MasonHeaderSecondary = { link = "MasonHeader" },
                    MasonHighlight = { link = "Special" },
                    MasonHighlightBlock = { fg = colors.fg1, bg = colors.bg8 },
                    MasonHighlightBlockBold = { fg = colors.fg1, bg = colors.bg8, bold = true },
                    MasonHighlightBlockBoldSecondary = { link = "MasonHighlightBlockSecondary" },
                    MasonHighlightBlockSecondary = { link = "MasonHighlightBlock" },
                    MasonHighlightSecondary = { link = "MasonHighlight" },
                    MasonMuted = { fg = colors.fg4 },
                    MasonMutedBlock = { bg = colors.bg3 },
                    MasonMutedBlockBold = { bg = colors.bg3, bold = true },
                }
            or {},

        -- https://github.com/lukas-reineke/indent-blankline.nvim
        plugins["indent-blankline.nvim"]
                and {
                    IblIndent = { fg = colors.fg5 },
                    IblScope = { fg = colors.fg4 },
                }
            or {},

        -- https://github.com/lewis6991/gitsigns.nvim
        plugins["gitsigns.nvim"]
                and {
                    GitSignsAdd = { fg = colors.fgc_green, bg = gutter_bg },
                    GitSignsAddCul = { fg = colors.fgc_green, bg = culhl_bg },
                    GitSignsChange = { fg = colors.fgc_magenta, bg = gutter_bg },
                    GitSignsChangeCul = { fg = colors.fgc_magenta, bg = culhl_bg },
                    GitSignsDelete = { fg = colors.fgc_red, bg = gutter_bg },
                    GitSignsDeleteCul = { fg = colors.fgc_red, bg = culhl_bg },
                }
            or {},

        -- https://github.com/nvim-telescope/telescope.nvim
        plugins["telescope.nvim"]
                and {
                    TelescopeBorder = { link = "FloatBorder" },
                    TelescopeNormal = { link = "NormalFloat" },
                    TelescopeSelection = { link = "PmenuSel" },
                    TelescopeTitle = { link = "FloatTitle" },
                }
            or {},

        -- https://github.com/nvim-tree/nvim-tree.lua
        plugins["nvim-tree.lua"]
                and {
                    NvimTreeNormal = { bg = colors.bg3 },
                    NvimTreeWinSeparator = solid and { fg = colors.fg4, bg = colors.bg3 } or { link = "WinSeparator" },
                    NvimTreeFolderName = { fg = colors.fgc_blue },
                    NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },
                    NvimTreeFolderIcon = { fg = colors.fgc_blue_dim },
                    NvimTreeSymlink = { fg = colors.fgc_cyan },
                    NvimTreeSymlinkFolderName = { link = "Directory" },
                    NvimTreeSymlinkIcon = { fg = colors.fg2 },
                    NvimTreeFolderArrowClosed = { fg = colors.fg3 },
                    NvimTreeFolderArrowOpen = { fg = colors.fg3 },
                    NvimTreeIndentMarker = { fg = colors.fg4 },
                }
            or {},

        -- https://github.com/nvim-tree/nvim-tree.lua
        plugins["mini.icons"]
                and {
                    MiniIconsAzure = { fg = colors.fgc_blue_dim },
                    MiniIconsBlue = { fg = colors.fgc_blue },
                    MiniIconsCyan = { fg = colors.fgc_cyan },
                    MiniIconsGreen = { fg = colors.fgc_green },
                    MiniIconsGrey = { fg = colors.fg3 },
                    MiniIconsOrange = { fg = colors.fgc_red_dim },
                    MiniIconsPurple = { fg = colors.fgc_magenta },
                    MiniIconsRed = { fg = colors.fgc_red },
                    MiniIconsYellow = { fg = colors.fgc_yellow },
                }
            or {},

        -- work-in-progress plugin integrations

        {
            SnacksPickerDimmed = { fg = colors.fg3 },
            SnacksPickerDir = { fg = colors.fg4 },
            BlinkCmpLabel = { fg = colors.fg3 },
            BlinkCmpLabelMatch = { fg = colors.fg1 },
            BlinkCmpLabelDetail = { fg = colors.fg3 },
            BlinkCmpKind = { link = "Special" },
            BlinkCmpSource = { fg = colors.fg3 },
        }
    )
end

---@type carbide.Schemes?
local current_schemes = nil

M.reset = function()
    current_schemes = nil
end

---@return carbide.Schemes
M.get = function()
    local palette, config = Palette.get(), Config.get()
    if current_schemes == nil then
        local overrides = Config.get().scheme_overrides or nil
        current_schemes = {
            light = fill_default_scheme(palette.light),
            dark = fill_default_scheme(palette.dark),
        }
        if overrides then
            for group, hl in pairs(overrides(palette.light, "light", config.style)) do
                current_schemes.light[group] = hl
            end
            for group, hl in pairs(overrides(palette.dark, "dark", config.style)) do
                current_schemes.dark[group] = hl
            end
        end
    end
    return current_schemes
end

return M
