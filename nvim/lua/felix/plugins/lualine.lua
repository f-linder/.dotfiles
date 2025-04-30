local status, lualine = pcall(require, "lualine")
if not status then
    return
end

lualine.setup({
    options = {
        theme = "horizon",
    },
    sections = {
        lualine_z = { "%l:%c/%L" },
    },
})
