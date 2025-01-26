local M = {}

---@type carbide.Config
local DEFAULT_CONFIG = {
    set_terminal_colors = true,
    fallback_background = "light",
    style = {
        transparent = false,
        gutter = "editor",
        keywords = { bold = false, italic = false },
        variables = { bold = false, italic = false },
        functions = { bold = false, italic = false },
        strings = { bold = false, italic = false },
        comments = { bold = false, italic = false },
    },
    plugins = {
        ["lazy.nvim"] = true,
        ["nvim-tree.lua"] = true,
        ["mason.nvim"] = true,
        ["indent-blankline.nvim"] = true,
        ["gitsigns.nvim"] = true,
        ["telescope.nvim"] = true,
        ["mini.icons"] = true,
    },
    palette_overrides = false,
    scheme_overrides = false,
}

---@type carbide.Config
local current_config = DEFAULT_CONFIG

---@return carbide.Config
M.get = function()
    return current_config
end

---@param opts? carbide.PartialConfig
M.set = function(opts)
    if not opts then
        current_config = DEFAULT_CONFIG
    else
        current_config = vim.tbl_deep_extend("force", DEFAULT_CONFIG, opts)
    end
end

return M
