local M = {}

---@type carbide.Palette
local DEFAULT_PALETTE = {
    light = {
        -- bg shades
        bg1 = "#efefef",
        bg2 = "#f7f7f7",
        bg3 = "#eae9e8",
        bg4 = "#e0e1df",
        bg5 = "#dbdad9",
        bg6 = "#d5d5d3",
        bg7 = "#b0afb1",
        bg8 = "#bdc0d2",

        -- bg colors
        bgc_red = "#ffcccc",
        bgc_green = "#e8d7b4",
        bgc_blue = "#e0ecc4",
        bgc_yellow = "#d1e3f0",
        bgc_cyan = "#c7d6d3",
        bgc_magenta = "#d5c7e0",

        -- fg shades
        fg1 = "#343232",
        fg2 = "#8C8A8B",
        fg3 = "#646364",
        fg4 = "#a2a09f",
        fg5 = "#c0bebd",
        fg6 = "#60564c",

        -- fg colors
        fgc_red = "#CE403B",
        fgc_red_dim = "#F74D47",
        fgc_yellow = "#E5A239",
        fgc_yellow_dim = "#E8BD3E",
        fgc_green = "#0D8224",
        fgc_green_dim = "#7BC454",
        fgc_blue = "#3467bb",
        fgc_blue_dim = "#4182c0",
        fgc_magenta = "#B500AE",
        fgc_magenta_dim = "#931d8f",
        fgc_cyan = "#51AD9F",
        fgc_cyan_dim = "#62D1C0",
    },
    dark = {
        -- bg shades
        bg1 = "#1c1c1c", -- main
        bg2 = "#19191a", -- float
        bg3 = "#222223", -- statuscolumn, winbar
        bg4 = "#292a2a", -- cursorline, cursorcolumn
        bg5 = "#323334", -- statusline, tabline
        bg6 = "#3d3d3e", -- pmenu
        bg7 = "#4d4a50", -- item sel
        bg8 = "#424852", -- text sel

        -- bg colors
        bgc_red = "#432224",
        bgc_green = "#222b22",
        bgc_blue = "#222b22",
        bgc_yellow = "#49402e",
        bgc_cyan = "#252d2d",
        bgc_magenta = "#312430",

        -- fg shades
        fg1 = "#c9c3b8", -- ui, buffer content
        fg2 = "#736a6a", -- buffer content secondary
        fg3 = "#878083", -- ui secondary
        fg4 = "#454041", -- ui dim
        fg5 = "#2d2929", -- ui faint
        fg6 = "#8f867b", -- buffer content delims

        fgc_red = "#C55350",
        fgc_red_dim = "#D47766",
        fgc_green = "#889b4a",
        fgc_green_dim = "#9FB95E",
        fgc_yellow = "#E09A49",
        fgc_yellow_dim = "#EFC05E",
        fgc_magenta = "#B26E97",
        fgc_magenta_dim = "#a197c5",
        fgc_blue = "#537f9f",
        fgc_blue_dim = "#8fa8b7",
        fgc_cyan = "#719F91",
        fgc_cyan_dim = "#72abad",
    },
}

---@type carbide.Palette?
local current_palette = nil

M.reset = function()
    current_palette = nil
end

---@return carbide.Palette
M.get = function()
    if current_palette == nil then
        local overrides = require("carbide.config").get().palette_overrides
        if overrides then
            current_palette = vim.tbl_deep_extend("force", DEFAULT_PALETTE, overrides)
        else
            current_palette = DEFAULT_PALETTE
        end
    end
    return current_palette
end

return M
