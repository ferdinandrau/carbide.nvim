local M = {}

---@type carbide.Palette
local DEFAULT_PALETTE = {
    light = {
        -- bg shades
        bg1 = "#efefef",
        bg2 = "#f7f7f7",
        bg3 = "#e8e8e8",
        bg4 = "#e4e3e4",
        bg5 = "#dfdede",
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
        fg1 = "#3c3c3c",
        fg2 = "#908e8f",
        fg3 = "#7b7b7a",
        fg4 = "#b4b4b4",
        fg5 = "#d7d7d7",
        fg6 = "#6e6466",

        -- fg colors
        fgc_red = "#ba3a35",
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
        bg1 = "#1c1c1c",
        bg2 = "#19191a",
        bg3 = "#202020",
        bg4 = "#252525",
        bg5 = "#323334",
        bg6 = "#3d3d3e",
        bg7 = "#4d4a50",
        bg8 = "#424852",

        -- bg colors
        bgc_red = "#432224",
        bgc_green = "#222b22",
        bgc_blue = "#222b22",
        bgc_yellow = "#49402e",
        bgc_cyan = "#252d2d",
        bgc_magenta = "#312430",

        -- fg shades
        fg1 = "#c9c3b8",
        fg2 = "#736a6a",
        fg3 = "#888184",
        fg4 = "#494849",
        fg5 = "#343031",
        fg6 = "#8f867b",

        -- fg colors
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
