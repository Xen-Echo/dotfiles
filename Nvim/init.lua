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
Plug 'kyazdani42/nvim-web-devicons'
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn["nvim-treesitter#TSUpdate"] })
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = '*' })
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'folke/which-key.nvim'
Plug('kylechui/nvim-surround', { tag = '*' })
Plug 'petertriho/nvim-scrollbar'
Plug 'FraserLee/ScratchPad'
Plug 'voldikss/vim-floaterm'
Plug 'folke/todo-comments.nvim'
Plug 'ziontee113/color-picker.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'folke/trouble.nvim'
Plug 'RRethy/vim-illuminate'
Plug 'jbyuki/venn.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'github/copilot.vim'
-- Language Server
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
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

map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>")                          -- Clear Search
map("n", "<C-c>", ":y*<CR>")                                            -- Copy to Clipboard
map("v", "<C-c>", "\"*y")                                               -- Copy to Clipboard
map("n", "<C-s>", ":w<CR>")                                             -- Write Normal
map("i", "<C-s>", "<ESC>:w<CR>")                                        -- Write Insert
map("n", "<C-z>", ":u<CR>")                                             -- Undo Normal
map("i", "<C-z>", "<ESC>:u<CR>")                                        -- Undo Insert
map("n", "<C-a>", ":%y*<CR>")                                           -- Yank All
map("n", "<C-UP>", "<C-w><UP>")                                         -- Move Up
map("n", "<C-DOWN>", "<C-w><DOWN>")                                     -- Move Down
map("n", "<C-RIGHT>", "<C-w><RIGHT>")                                   -- Move Right
map("n", "<C-LEFT>", "<C-w><LEFT>")                                     -- Move Left
map("n", "<C-M-l>", "<cmd>lua vim.lsp.buf.formatting()<CR>")            -- Reformat Code
map("v", "<C-x>", ":'<,'>!PowerShell -NoLogo -NonInteractive<CR>")      -- Execute Selection

local which_key = require("which-key")

which_key.setup {
    spelling = {
      enabled = true,
      suggestions = 20,
    }
}

which_key.register({
    ["<Leader>"] = { "<CMD>Telescope find_files<CR>", "Fuzzy File Search" },
    q = { ":q<CR>", "Exit" },
    e = {
        name = "Editor",
        cc = { ":ColorizerToggle<CR>", "Toggle Colourizer" },
        cp = { ":PickColor<CR>", "Colour Picker" },
        n = { "<CMD>lua require('todo-comments').jump_next()<CR>", "Next TODO" },
        p = { "<CMD>lua require('todo-comments').jump_prev()<CR>", "Prev TODO" },
        t = { ":TodoTelescope<CR>", "Telescope TODO" },
        q = { ":TodoQuickFix<CR>", "Quickfix TODO" },
        e = { ":TroubleToggle<CR>", "Code Analysis" },
        v = { "<CMD>lua toggle_venn()<CR>", "Diagram" },
        gd = { ":DiffviewOpen<CR>", "Open Diff" },
        gc = { ":DiffviewClose<CR>", "Close Diff" },
    },
    t = {
        name = "Terminal",
        t = { ":FloatermToggle<CR>", "Toggle Terminal" },
        n = { ":FloatermNew --name=node node<CR>", "Node Repl" },
        d = { ":FloatermNew --name=deno deno<CR>", "Deno Repl" },
        p = { ":FloatermNew --name=python python<CR>", "Python Repl" },
        k = { ":FloatermKill<CR>", "Close Terminal" },
        ["["] = { ":FloatermPrev<CR>", "Previous Terminal" },
        ["]"] = { ":FloatermNext<CR>", "Next Terminal" }
    },
    w = {
        name = "Window",
        h = { ":tabp<CR>", "Prev Tab" },
        l = { ":tabn<CR>", "Next Tab" },
        n = { ":tabnew<CR>", "New Tab" },
        s = { ":ScratchPad<CR>", "Scratch Pad" }
    },
    f = {
        name = "File",
        f = { "<CMD>Telescope find_files<CR>", "Fuzzy File Search" },
        r = { "<CMD>Telescope oldfiles<CR>", "Open Recent File" },
        g = { "<CMD>Telescope live_grep<CR>", "Grep Search Files" },
        t = { "<CMD>Telescope file_browser<CR>", "Show File Browser" } 
    },
    l = {
        name = "LSP",
        f = { "<CMD>lua vim.diagnostic.open_float()<CR>", "Show Diagnostics" },
        n = { "<CMD>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
        p = { "<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>", "Prev Diagnostic" },
        d = { "<CMD>lua vim.lsp.buf.definition()<CR>", "Go To Definition" },
        i = { "<CMD>lua vim.lsp.buf.implementation()<CR>", "Go To Implementation" },
        q = { "<CMD>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
        r = { "<CMD>lua vim.lsp.buf.rename()<CR>", "Rename" },
        a = { "<CMD>lua vim.lsp.buf.references()<CR>", "References" },
        h = { "<CMD>lua vim.lsp.buf.hover()<CR>", "Hover" },
        c = { "<CMD>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
        li = { ":LspInfo<CR>", "LSP Info" },
        lr = { ":LspRestart<CR>", "LSP Restart Server" }
    },
}, { prefix = "<Leader>" })

-- ========================================================= --
-- Venn
-- ========================================================= --

--[[
   ┌──────┐           ┌───────┐
   │ Test ├──Invoke──►│ Hello │
   └──────┘           └───────┘
]]--

function _G.toggle_venn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == "nil" then
        vim.b.venn_enabled = true
        vim.cmd[[setlocal ve=all]]
        -- Draw a line on HJKL keystokes
        vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
        -- Draw a box by pressing "f" with visual selection
        vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
    else
        vim.cmd[[setlocal ve=]]
        vim.cmd[[mapclear <buffer>]]
        vim.b.venn_enabled = nil
    end
end

-- ========================================================= --
-- Todo Comments
-- ========================================================= --

-- TODO: Test 
-- HACK: Test
-- BUG: Test
-- PERF: Test
-- NOTE: Test
-- WARNING: Test

require("todo-comments").setup {
    colors = {
        error = { "#E06C75" },
        warning = { "#E5C07B" },
        info = { "#61AFEF" },
        hint = { "#98C379" },
        default = {  "#61AFEF" },
        test = { "#C678DD" }
    }
}

-- ========================================================= --
-- Floaterm
-- ========================================================= --

vim.g["floaterm_shell"] = "PowerShell"
vim.g["floaterm_autoinsert"] = false

-- ========================================================= --
-- Surround Config
-- ========================================================= --

require("nvim-surround").setup()

-- ========================================================= --
-- ScratchPad Config
-- ========================================================= --

vim.g["scratchpad_autostart"] = 0

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

vim.g.markdown_fenced_languages = {
    "ts=typescript"
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
-- Vim Illuminate
-- ========================================================= --

require('illuminate').configure()

-- ========================================================= --
-- Scrollbar
-- ========================================================= --

require("scrollbar").setup()

-- ========================================================= --
-- Colour Picker
-- ========================================================= --

require("color-picker").setup()

-- ========================================================= --
-- Colorizer
-- ========================================================= --

require('colorizer').setup()

-- ========================================================= --
-- Trouble
-- ========================================================= --

require("trouble").setup()

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
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = { query = "@function.outer", desc = "Function Outer" },
                ["if"] = { query = "@function.inner", desc = "Function Inner" },
                ["ac"] = { query = "@class.outer", desc = "Class Outer" },
                ["ic"] = { query = "@class.inner", desc = "Class Inner" },
                ["ab"] = { query = "@block.outer", desc = "Block Inner"  },
                ["ib"] = { query = "@block.inner", desc = "Block Inner"  }
            },
            selection_modes = {
                ['@parameter.outer'] = 'v', -- Charwise
                ['@function.outer'] = 'V', -- Linewise
                ['@class.outer'] = '<c-v>', -- Blockwise
            },
            include_surrounding_whitespace = true,
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]s"] = { query = "@scope.outer", desc = "Next Scope Start" },
                ["]m"] = { query = "@function.outer", desc = "Next Method Start" },
            },
            goto_next_end = {
                ["]s"] = { query = "@scope.outer", desc = "Next Scope End" },
                ["]M"] = { query = "@function.outer", desc = "Next Method End" },
            },
            goto_previous_start = {
                ["[s"] = { query = "@scope.outer", desc = "Prev Scope Start" },
                ["[m"] = { query = "@function.outer", desc = "Prev Method Start" },
            },
            goto_previous_end = {
                ["[S"] = { query = "@scope.outer", desc = "Prev Scope End" },
                ["[M"] = { query = "@function.outer", desc = "Prev Method End" },
            }
        }
    },
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
            { name = 'buffer' }
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

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

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
    },
    extensions = {
        file_browser = {
          theme = "ivy"
        },
    }
}

require("telescope").load_extension("file_browser")

-- ========================================================= --
-- General LSP
-- ========================================================= --

local nvim_lsp = require('lspconfig')
require("mason").setup()
require("mason-lspconfig").setup()

-- ========================================================= --
-- Rust LSP
-- ========================================================= --

nvim_lsp.rust_analyzer.setup {
    capabilities = capabilities,
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
}

-- ========================================================= --
-- JavaScript / TypeScript LSP
-- ========================================================= --

-- Config is handled with a tsconfig or jsconfig file in the directory

nvim_lsp.tsserver.setup {
    capabilities = capabilities,
    root_dir = nvim_lsp.util.root_pattern("package.json")
}

nvim_lsp.eslint.setup {
    capabilities = capabilities,
    root_dir = nvim_lsp.util.root_pattern("package.json")
}

-- ========================================================= --
-- JSON LSP
-- ========================================================= --

nvim_lsp.jsonls.setup {
    capabilities = capabilities
}

-- ========================================================= --
-- Deno LSP
-- ========================================================= --

nvim_lsp.denols.setup {
    capabilities = capabilities,
    root_dir = nvim_lsp.util.root_pattern("deno.json")
}
