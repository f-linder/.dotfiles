-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
treesitter.setup({
    ensure_isntalled = { 
        "help", 
        "lua", 
        "python", 
        "go", 
        "rust", 
        "cpp", 
        "c", 
        "yaml", 
        "json", 
        "dockerfile", 
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
})
