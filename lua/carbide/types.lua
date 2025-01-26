-- Basic types

---@alias carbide.Variant "light" | "dark"
---@alias carbide.Name "carbide" | "carbide-light" | "carbide-dark"
---@alias carbide.Version  "dynamic" | "light" | "dark"
---@alias carbide.VersionArg  nil | "light" | "dark"
---@alias carbide.Colors table<string, string>
---@alias carbide.Scheme table<string, table>

---@class (exact) carbide.Palette
---@field light carbide.Colors
---@field dark carbide.Colors

---@class (exact) carbide.PartialPalette
---@field light? carbide.Colors
---@field dark? carbide.Colors

---@class (exact) carbide.Schemes
---@field light carbide.Scheme
---@field dark carbide.Scheme

-- Global configuration: should contain a valid value of every key at any time

---@alias carbide.ConfigOpts.FallbackBackground "light" | "dark"
---@alias carbide.ConfigOpts.SetTerminalColors boolean
---@alias carbide.ConfigOpts.PaletteOverrides false | carbide.PartialPalette
---@alias carbide.ConfigOpts.SchemeOverrides false | fun(colors?: carbide.Colors, variant?: carbide.Variant, style?: carbide.ConfigOpts.Style): carbide.Scheme

---@class (exact) carbide.ConfigOpts.Style.BoldItalicStyle
---@field bold boolean
---@field italic boolean

---@class (exact) carbide.ConfigOpts.Style
---@field transparent boolean
---@field gutter "editor" | "editor_extended" |  "solid" | "solid_extended"
---@field keywords carbide.ConfigOpts.Style.BoldItalicStyle
---@field variables carbide.ConfigOpts.Style.BoldItalicStyle
---@field functions carbide.ConfigOpts.Style.BoldItalicStyle
---@field strings carbide.ConfigOpts.Style.BoldItalicStyle
---@field comments carbide.ConfigOpts.Style.BoldItalicStyle

---@class (exact) carbide.ConfigOpts.Plugins
---@field lazy.nvim boolean
---@field nvim-tree.lua boolean
---@field mason.nvim boolean
---@field indent-blankline.nvim boolean
---@field gitsigns.nvim boolean
---@field telescope.nvim boolean
---@field mini.icons boolean

---@class (exact) carbide.Config
---@field fallback_background carbide.ConfigOpts.FallbackBackground
---@field set_terminal_colors carbide.ConfigOpts.SetTerminalColors
---@field palette_overrides carbide.ConfigOpts.PaletteOverrides
---@field scheme_overrides carbide.ConfigOpts.SchemeOverrides
---@field style carbide.ConfigOpts.Style
---@field plugins carbide.ConfigOpts.Plugins

-- Partial configuration passed by the user: does not have to contain every key

---@class (exact) carbide.PartialConfigOpts.Style.BoldItalicStyle
---@field bold? boolean
---@field italic? boolean

---@class (exact) carbide.PartialConfigOpts.Style
---@field transparent? boolean
---@field gutter? "line" | "extended" | "solid"
---@field keywords? carbide.PartialConfigOpts.Style.BoldItalicStyle
---@field variables? carbide.PartialConfigOpts.Style.BoldItalicStyle
---@field functions? carbide.PartialConfigOpts.Style.BoldItalicStyle
---@field strings? carbide.PartialConfigOpts.Style.BoldItalicStyle
---@field comments? carbide.PartialConfigOpts.Style.BoldItalicStyle

---@class (exact) carbide.PartialConfigOpts.Plugins
---@field lazy.nvim? boolean
---@field nvim-tree.lua? boolean
---@field mason.nvim? boolean
---@field indent-blankline.nvim? boolean
---@field gitsigns.nvim? boolean
---@field telescope.nvim? boolean
---@field mini.icons? boolean

---@class (exact) carbide.PartialConfig
---@field fallback_background? carbide.ConfigOpts.FallbackBackground
---@field set_terminal_colors? carbide.ConfigOpts.SetTerminalColors
---@field palette_overrides? carbide.ConfigOpts.PaletteOverrides
---@field scheme_overrides? carbide.ConfigOpts.SchemeOverrides
---@field style? carbide.PartialConfigOpts.Style
---@field plugins? carbide.PartialConfigOpts.Plugins
