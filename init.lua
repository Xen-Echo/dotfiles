-- ========================================================= --
-- Plugin Configuration
-- ========================================================= --

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
-- Autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/vim-vsnip'
-- Features
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn["nvim-treesitter#TSUpdate"] })
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = '*' })
Plug 'nvim-lua/plenary.nvim'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'folke/which-key.nvim'
Plug('kylechui/nvim-surround', { tag = '*' })
-- Language Server
Plug 'neovim/nvim-lspconfig'
-- Theme
Plug('EdenEast/nightfox.nvim', { tag = 'v1.0.0' })
vim.call('plug#end')

-- ========================================================= --
-- Keybindings
-- ========================================================= --

function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>")       -- Clear search
map("n", "<C-c>", ":q<CR>")                          -- Quit
map("n", "<C-s>", ":w<CR>")                          -- Write Normal
map("i", "<C-s>", "<ESC>:w<CR>")                     -- Write Insert
map("n", "<C-a>", ":%y+<CR>")                        -- Yank all
map("n", "<C-UP>", "<C-w><UP>")                      -- Move Up
map("n", "<C-DOWN>", "<C-w><DOWN>")                  -- Move Down
map("n", "<C-RIGHT>", "<C-w><RIGHT>")                -- Move Right
map("n", "<C-LEFT>", "<C-w><LEFT>")                  -- Move Left

local which_key = require("which-key")

which_key.setup {
    spelling = {
      enabled = true,
      suggestions = 20,
    }
}

which_key.register({
    ["<Leader>"] = { "<CMD>NvimTreeToggle<CR>", "Toggle Tree" },
    t = { "<C-w>s<CR><C-w><DOWN>:resize 10<CR>:terminal<CR>", "Open Terminal" },
    w = {
        name = "window",
        h = { ":tabp<CR>", "Prev Tab" },
        l = { ":tabn<CR>", "Next Tab" },
        n = { ":tabnew<CR>", "New Tab" },
    },
    f = {
        name = "file",
        f = { "<CMD>Telescope find_files<CR>", "Fuzzy File Search" },
        r = { "<CMD>Telescope oldfiles<CR>", "Open Recent File" },
        g = { "<CMD>Telescope live_grep<CR>", "Grep Search Files" }
    },
    l = {
        name = "lsp",
        f = { "<CMD>lua vim.diagnostic.open_float()<CR>", "Show Diagnostics" },
        n = { "<CMD>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
        N = { "<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>", "Prev Diagnostic" },
        d = { "<CMD>lua vim.lsp.buf.definition()<CR>", "Go To Definition" },
        i = { "<CMD>lua vim.lsp.buf.implementation()<CR>", "Go To Implementation" },
        q = { "<CMD>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
        r = { "<CMD>lua vim.lsp.buf.rename()<CR>", "Rename" },
        a = { "<CMD>lua vim.lsp.buf.references()<CR>", "References" },
        h = { "<CMD>lua vim.lsp.buf.hover()<CR>", "Hover" },
        c = { "<CMD>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
        li = { ":LspInfo<CR>", "LSP Info" },
        lr = { ":LspRestart<CR>", "LSP Restart Server" }
    }
}, { prefix = "<Leader>" })

-- ========================================================= --
-- Surround Config
-- ========================================================= --

require("nvim-surround").setup({
})

-- ========================================================= --
-- Behaviour Settings
-- ========================================================= --

vim.wo.number = true
vim.cmd('set splitright')

-- ========================================================= --
-- Tab Settings
-- ========================================================= --

vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set expandtab')

-- ========================================================= --
-- Whitespace Settings
-- ========================================================= --

--vim.cmd('set list')
--vim.cmd('set listchars+=space:.,tab:>-')
--vim.cmd('hi NonText ctermfg=238 guifg=x238_Grey27')

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
--vim.opt.listchars:append "eol:↴"

vim.cmd [[highlight IndentBlanklineIndent6 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#C678DD gui=nocombine]]

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    }
}

-- ========================================================= --
-- Theme Settings
-- ========================================================= --

vim.cmd('set termguicolors')
vim.cmd('set noshowmode')
vim.cmd('set noshowcmd')
require('nightfox').setup {
    transparent = true
}
vim.cmd("colorscheme nordfox")

-- ========================================================= --
-- Tresitter Config
-- ========================================================= --

require('nvim-treesitter.install').compilers = { 'zig' }
require('nvim-treesitter.configs').setup {
    ensure_installed = { "lua" },
    auto_install = true,
    highlight = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}

-- ========================================================= --
-- Autocompletion 
-- ========================================================= --

vim.o.completeopt = "menu,menuone,noselect"

local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-UP>'] = cmp.mapping.scroll_docs(-4),
        ['<C-DOWN>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }), 
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        })
    }),
    sources = cmp.config.sources(
        {
            { name = 'nvim_lua' },
            { name = 'nvim_lsp_signature_help' },
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
            { name = 'path' },
            { name = 'buffer' },
        }
    )
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' },
    })
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- ========================================================= --
-- Tree Config
-- ========================================================= --

require("nvim-tree").setup {
    view = {
        side = 'left',
        adaptive_size = true
    },
    renderer = {
        indent_markers = {
            enable = true
        }
    }
}

-- ========================================================= --
-- Status Bar Config
-- ========================================================= --

require('lualine').setup()

-- ========================================================= --
-- Telescope Config
-- ========================================================= --

-- Required for live_grep: https://github.com/BurntSushi/ripgrep
local telescope_actions = require "telescope.actions"
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<CR>"] = telescope_actions.select_vertical,
                ["<C-UP>"] = telescope_actions.preview_scrolling_up,
                ["<C-DOWN>"] = telescope_actions.preview_scrolling_down,
            },
            n = {
                ["<CR>"] = telescope_actions.select_vertical,
                ["<C-UP>"] = telescope_actions.preview_scrolling_up,
                ["<C-DOWN>"] = telescope_actions.preview_scrolling_down,
            }
        }
    }
}

-- ========================================================= --
-- General LSP
-- ========================================================= --

local nvim_lsp =require('lspconfig')

local on_lsp_attach = function(client)
    require'completion'.on_attach(client)
end

-- ========================================================= --
-- Rust LSP
-- ========================================================= --

nvim_lsp.rust_analyzer.setup({
    on_attach = on_lsp_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})

-- Register Rust LSP
require('lspconfig')['rust_analyzer'].setup { capabilities = capabilities }
-- Register TypeScript/JavaScript LSP
require('lspconfig')['tsserver'].setup { capabilities = capabilities }

-- ========================================================= --
-- Neovide Config
-- ========================================================= --

if vim.g['neovide'] ~= nil then
    vim.g['neovide_transparency'] = 0.9
end

