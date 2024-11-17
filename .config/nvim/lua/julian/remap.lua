vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-z>", "<cmd>ZenMode<cr>")

vim.keymap.set("n", "C-d>", "<C-d>zz")
vim.keymap.set("n", "C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>t", "<cmd>Telescope<cr>")

vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "k", "kzz")

-- ["<leader>ca"] = vim.lsp.buf.code_action(),
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")

-- I dont like this...
-- vim.keymap.set({"n", "v"}, "<leader>em", "<C-y>,")

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Everyting below stolen from @theprimeagen

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/<CR>")
vim.keymap.set("n", "<leader>vpe", "<cmd>e ~/.config/hypr/<CR>")
vim.keymap.set("n", "<leader>vps", "<cmd>e ~/.config/sway/<CR>")
vim.keymap.set("n", "<leader>vpc", "<cmd>e ~/.config/<CR>")

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)


