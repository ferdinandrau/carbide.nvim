local M = {}

---@type carbide.Palette
local DEFAULT_PALETTE = {
    light = {
        -- bg shades
        bg1 = "#F2F1F1",
        bg2 = "#F8F8F8",
        bg3 = "#EAEAEA",
        bg4 = "#E4E3E4",
        bg5 = "#DCDBDB",
        bg6 = "#D5D5D3",
        bg7 = "#B0AFB1",
        bg8 = "#BDC0D2",

        -- bg colors
        bgc_red = "#FFCCCC",
        bgc_green = "#E0ECC4",
        bgc_blue = "#D1E3F0",
        bgc_yellow = "#E8D7B4",
        bgc_cyan = "#C7D6D3",
        bgc_magenta = "#D5C7E0",

        -- fg shades
        fg1 = "#3B3A3A",
        fg2 = "#908E8F",
        fg3 = "#7B7B7A",
        fg4 = "#B4B4B4",
        fg5 = "#D7D7D7",
        fg6 = "#7F797B",

        -- fg colors
        fgc_red = "#CD122A",
        fgc_red_dim = "#CB6553",
        fgc_yellow = "#C78100",
        fgc_yellow_dim = "#E89B0B",
        fgc_green = "#43911F",
        fgc_green_dim = "#50AC25",
        fgc_blue = "#1563D8",
        fgc_blue_dim = "#588DC4",
        fgc_magenta = "#CE3390",
        fgc_magenta_dim = "#8D77DD",
        fgc_cyan = "#3F968C",
        fgc_cyan_dim = "#47B8B6",
    },
    dark = {
        -- bg shades
        bg1 = "#1C1C1C",
        bg2 = "#19191A",
        bg3 = "#202020",
        bg4 = "#252525",
        bg5 = "#323334",
        bg6 = "#3D3D3E",
        bg7 = "#4D4A50",
        bg8 = "#424852",

        -- bg colors
        bgc_red = "#432224",
        bgc_green = "#222B22",
        bgc_blue = "#222B22",
        bgc_yellow = "#49402E",
        bgc_cyan = "#252D2D",
        bgc_magenta = "#312430",

        -- fg shades
        fg1 = "#C9C3B8",
        fg2 = "#736A6A",
        fg3 = "#888184",
        fg4 = "#494849",
        fg5 = "#343031",
        fg6 = "#8F8C84",

        -- fg colors
        fgc_red = "#C55350",
        fgc_red_dim = "#D47766",
        fgc_green = "#889B4A",
        fgc_green_dim = "#9AB25C",
        fgc_yellow = "#E19E54",
        fgc_yellow_dim = "#E1B75E",
        fgc_magenta = "#B26E97",
        fgc_magenta_dim = "#B896BA",
        fgc_blue = "#7490BA",
        fgc_blue_dim = "#9BAEC9",
        fgc_cyan = "#77A59B",
        fgc_cyan_dim = "#89B9B0",
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
