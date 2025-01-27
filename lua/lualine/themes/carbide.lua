local background = vim.o.background

if background == "light" then
    return require("lualine.themes.carbide-light")
elseif background == "dark" then
    return require("lualine.themes.carbide-dark")
else
    local fallback = require("carbide.config").get().fallback_background
    if fallback == "light" then
        return require("lualine.themes.lavish-light")
    else
        return require("lualine.themes.lavish-dark")
    end
end
