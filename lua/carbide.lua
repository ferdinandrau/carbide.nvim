local Config = require("carbide.config")
local Palette = require("carbide.palette")
local Schemes = require("carbide.schemes")

local M = {}

---@type boolean
local did_setup_without_apply = false

---@param colors carbide.Colors
---@param variant carbide.Variant
local function set_terminal_colors(colors, variant)
    local g = vim.g
    if variant == "light" then
        g.terminal_color_0 = colors.fg2
        g.terminal_color_8 = colors.fg3
        g.terminal_color_7 = colors.bg5
        g.terminal_color_15 = colors.bg1
    else
        g.terminal_color_0 = colors.bg1
        g.terminal_color_8 = colors.bg5
        g.terminal_color_7 = colors.fg3
        g.terminal_color_15 = colors.fg2
    end
    g.terminal_color_1 = colors.red
    g.terminal_color_9 = colors.red_bold
    g.terminal_color_2 = colors.green
    g.terminal_color_10 = colors.green_bold
    g.terminal_color_3 = colors.yellow
    g.terminal_color_11 = colors.yellow_bold
    g.terminal_color_4 = colors.blue
    g.terminal_color_12 = colors.blue_bold
    g.terminal_color_5 = colors.magenta
    g.terminal_color_13 = colors.magenta_bold
    g.terminal_color_6 = colors.cyan
    g.terminal_color_14 = colors.cyan_bold
end

---@param version carbide.VersionArg
M.apply = function(version)
    ---@type carbide.Name
    local name
    ---@type carbide.Variant
    local variant
    local background = vim.o.background
    local config = Config.get()

    if version == nil then
        name = "carbide"
        variant = background ~= "" and background or config.fallback_background
    elseif version == "light" then
        name = "carbide-light"
        variant = "light"
    elseif version == "dark" then
        name = "carbide-dark"
        variant = "dark"
    else
        vim.notify(
            ('carbide.nvim: "%s" is not a valid argument for `apply`. Use "light", "dark" or `nil` (no argument).'):format(
                tostring(version)
            ),
            vim.log.levels.ERROR
        )
        return
    end

    if did_setup_without_apply then
        Palette.reset()
        Schemes.reset()
        did_setup_without_apply = false
    end

    if vim.g.colors_name then
        vim.cmd.highlight("clear")
    end
    vim.g.colors_name = name

    local set_hl = vim.api.nvim_set_hl
    local scheme = Schemes.get()[variant]
    for group, hl in pairs(scheme) do
        hl.force = true
        set_hl(0, group, hl)
    end

    if config.set_terminal_colors then
        set_terminal_colors(Palette.get()[variant], variant)
    end
end

---@param opts? carbide.PartialConfig
M.setup = function(opts)
    Config.set(opts)
    did_setup_without_apply = true
end

return M
