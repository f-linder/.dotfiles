-- auto install packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])

local status,packer = pcall(require, "packer")
if not status then
    return
end

-- list of plugins
return packer.startup(function(use)
    use("wbthomason/packer.nvim") -- packer / plugin manager itself

    use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

    -- colorschemes
    use("bluz71/vim-nightfly-guicolors")
    use("olivercederborg/poimandres.nvim")
    use("folke/tokyonight.nvim")
    use{"catppuccin/nvim", as = "catppuccin"}
    use("nyoom-engineering/oxocarbon.nvim")

    use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

    use("szw/vim-maximizer") -- maximizes and restores current window

    use("tpope/vim-surround") -- add, delete, change surroundings 

    use("numToStr/Comment.nvim") -- commenting with gc

    use("nvim-tree/nvim-tree.lua") -- file explorer

    use("nvim-tree/nvim-web-devicons") -- vs-code like icons

    use("nvim-lualine/lualine.nvim") -- statusline

    -- fuzzy finder w/ telescope
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

    -- everything lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},           
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            {'L3MON4D3/LuaSnip'},   
            {'hrsh7th/cmp-buffer'},     
            {'hrsh7th/cmp-path'},     
            {'hrsh7th/cmp-vsnip'},
            {'hrsh7th/cmp-nvim-lsp-signature-help'},
        }
    }

    -- treesitter
    use {"nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- undotree
    use("mbbill/undotree")

    -- auto closing
    use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...

    -- git integration
    use("lewis6991/gitsigns.nvim") -- show line modification on left hand side

    -- tabbing out of matching symbols
    use("abecodes/tabout.nvim")


    if packer_bootstrap then
        require("packer").sync()
    end
end)
