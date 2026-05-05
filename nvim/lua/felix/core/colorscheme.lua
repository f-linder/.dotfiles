local status, _ = pcall(vim.cmd, "colorscheme rose-pine-moon")

if not status then
    print("Colorscheme not found!")
    return
end


