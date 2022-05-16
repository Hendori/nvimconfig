-- options.lua
local o = vim.opt
-- Visual
local options = {
    conceallevel   = 0, -- Don't hide quotes in markdown
    cmdheight      = 1,
    pumheight      = 10,
    showmode       = true,
    showtabline    = 2, -- Always show tabline
    title          = true,
    termguicolors  = true, -- Use true colors, required for some plugins
    number         = true,
    relativenumber = true,
    signcolumn     = 'yes',
    cursorline     = false,

    -- Behaviour
    hlsearch      = false,
    ignorecase    = true, -- Ignore case when using lowercase in search
    smartcase     = true, -- But don't ignore it when using upper case
    smarttab      = true,
    smartindent   = true,
    expandtab     = true, -- Convert tabs to spaces.
    tabstop       = 4,
    softtabstop   = 4,
    shiftwidth    = 4,
    splitbelow    = true,
    splitright    = true,
    scrolloff     = 12, -- Minimum offset in lines to screen borders
    sidescrolloff = 8,
    mouse         = 'a',

    -- Vim specific
    hidden       = true, -- Do not save when switching buffers
    fileencoding = "utf-8",
    spell        = false,
    spelllang    = "en_us",
    completeopt  = "menuone,noinsert,noselect",
    wildmode     = "longest,full", -- Display auto-complete in Command Mode
    updatetime   = 300, -- Delay until write to Swap and HoldCommand event
}
-- Disable default plugin
-- vim.g.loaded_netrwPlugin = false

-- Providers
-- vim.g.python3_host_prog  = '/home/milton/software/miniconda/envs/pynvim/bin/python'

for k, v in pairs(options) do
    o[k] = v
end


-- Disable inline error messages
vim.diagnostic.config {
    virtual_text = true,
    underline = true, -- Keep error underline
    signs = true, -- Keep gutter signs
}
