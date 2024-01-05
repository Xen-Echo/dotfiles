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
