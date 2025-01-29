local M = {}

---@type carbide.Palette
local DEFAULT_PALETTE = {
    light = {
        -- bg shades
        bg1 = "#efefef",
        bg2 = "#f7f7f7",
        bg3 = "#eaeaea",
        bg4 = "#e4e3e4",
        bg5 = "#dcdbdb",
        bg6 = "#d5d5d3",
        bg7 = "#b0afb1",
        bg8 = "#bdc0d2",

        -- bg colors
        bgc_red = "#ffcccc",
        bgc_green = "#e0ecc4",
        bgc_blue = "#d1e3f0",
        bgc_yellow = "#e8d7b4",
        bgc_cyan = "#c7d6d3",
        bgc_magenta = "#d5c7e0",

        -- fg shades
        fg1 = "#3b3a3a",
        fg2 = "#908e8f",
        fg3 = "#7b7b7a",
        fg4 = "#b4b4b4",
        fg5 = "#d7d7d7",
        fg6 = "#7f797b",

        -- fg colors
        fgc_red = "#ba3a35",
        fgc_red_dim = "#c65a47",
        fgc_yellow = "#d68504",
        fgc_yellow_dim = "#e7af3b",
        fgc_green = "#569f35",
        fgc_green_dim = "#8ebf5a",
        fgc_blue = "#3f6fb1",
        fgc_blue_dim = "#588dc4",
        fgc_magenta = "#b4568e",
        fgc_magenta_dim = "#8d77dd",
        fgc_cyan = "#51968e",
        fgc_cyan_dim = "#60bab8",
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
        fg6 = "#8f8c84",

        -- fg colors
        -- fgc_red = "#C55350",
        -- fgc_red_dim = "#D47766",
        -- fgc_green = "#889b4a",
        -- fgc_green_dim = "#9FB95E",
        -- fgc_yellow = "#e29741",
        -- fgc_yellow_dim = "#deac44",
        -- fgc_magenta = "#B26E97",
        -- fgc_magenta_dim = "#a197c5",
        -- fgc_blue = "#537f9f",
        -- fgc_blue_dim = "#8fa8b7",
        -- fgc_cyan = "#719F91",
        -- fgc_cyan_dim = "#82b5b1",
        fgc_red = "#ca595b",
        fgc_red_dim = "#D47766",
        fgc_green = "#889b4a",
        fgc_green_dim = "#9ab25c",
        fgc_yellow = "#e19e54",
        fgc_yellow_dim = "#eec186",
        fgc_magenta = "#B26E97",
        fgc_magenta_dim = "#aa82ae",
        fgc_blue = "#7490ba",
        fgc_blue_dim = "#9baec9",
        fgc_cyan = "#77a59b",
        fgc_cyan_dim = "#83bfb4",
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
