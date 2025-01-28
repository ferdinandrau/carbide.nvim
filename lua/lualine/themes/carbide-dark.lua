local colors = require("carbide.palette").get().dark

return {
    normal = {
        a = { bg = colors.fgc_green, fg = colors.bg1, gui = "bold" },
        b = { bg = colors.bg5, fg = colors.fg1 },
        c = { bg = colors.bg3, fg = colors.fg1 },
    },
    insert = {
        a = { bg = colors.fgc_cyan, fg = colors.bg1, gui = "bold" },
        b = { bg = colors.bg5, fg = colors.fg1 },
        c = { bg = colors.bg3, fg = colors.fg1 },
    },
    visual = {
        a = { bg = colors.fgc_yellow, fg = colors.bg1, gui = "bold" },
        b = { bg = colors.bg5, fg = colors.fg1 },
        c = { bg = colors.bg3, fg = colors.fg1 },
    },
    replace = {
        a = { bg = colors.fgc_red, fg = colors.bg1, gui = "bold" },
        b = { bg = colors.bg5, fg = colors.fg1 },
        c = { bg = colors.bg3, fg = colors.fg1 },
    },
    command = {
        a = { bg = colors.fgc_blue, fg = colors.bg1, gui = "bold" },
        b = { bg = colors.bg5, fg = colors.fg1 },
        c = { bg = colors.bg3, fg = colors.fg1 },
    },
    inactive = {
        a = { bg = colors.bg6, fg = colors.fg3, gui = "bold" },
        b = { bg = colors.bg5, fg = colors.fg3 },
        c = { bg = colors.bg3, fg = colors.fg3 },
    },
}
