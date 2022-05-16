-- plugins.lua

-- usein definition and loading
-- local execute = vim.api.nvim_command

local fn = vim.fn
local cmd = vim.cmd

-- Boostrap Packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
end

-- Rerun PackerCompile everytime plugins.lua is updated
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Load Packer
cmd([[packadd packer.nvim]])



-- Initialize plugins
return require('packer').startup(function(use)
    -- Let Packer manage itself
    use({ 'wbthomason/packer.nvim', opt = true })
    -- Post-install/update hook with neovim command
    -- The plugins
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- Formatting
    use 'tpope/vim-commentary'
    use 'junegunn/vim-easy-align'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
    -- LSP client and AutoInstaller
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'mfussenegger/nvim-jdtls'

    -- Which keys
    use 'folke/which-key.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
