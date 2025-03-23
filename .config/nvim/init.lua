require "julian.remap"
require "julian.plugins"

require "java"

-- Notes
-- :lua vim.diagnostic.setqflist()
--          lsp.buf.format()
--          and so on...
--
--  Quickfix list
--  :copen
--  :cn[ext]
--  :cp[revious]
--  :cfirst / :clast



-- For local plugins :3
local plugin_path = os.getenv("HOME") .. "/workspace/neovim/plugins"
vim.opt.rtp:prepend(plugin_path)

-- package.path = package.path .. ";" .. plugin_path .. "/uwu/lua/?.lua"
-- require("uwu.init").setup()

vim.opt     .number             = true
vim.opt     .relativenumber     = true
vim.opt     .expandtab          = true
vim.opt     .tabstop            = 4
vim.opt     .shiftwidth         = 4
vim.opt     .softtabstop        = 4

vim.g       .netrw_banner       = false


vim.opt     .completeopt        = {'menuone', 'noselect', 'noinsert'}
vim.opt     .shortmess          = vim.opt.shortmess + { c = true}

vim.filetype.add({
    pattern = {
        ['.*%.nasm'] = "nasm",
    }
})

-- vim.cmd([[
--     set signcolumn=yes
--     autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
-- ]])

vim.cmd "set nowrap"
require("rose-pine").setup({
    variant = "auto", -- auto, main, moon, or dawn
    dark_variant = "main", -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    styles = {
        bold = true,
        italic = true,
        transparency = true,
    },
})

vim.cmd "colorscheme rose-pine"
-- vim.cmd "colorscheme quiet"




-- ### Some plugin setups ### --
require("presence").setup({
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "That editor for idiots", -- Text displayed when hovered over the Neovim image
    main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
    client_id           = "1172122807501594644",       -- Use your own Discord application client id (not recommended)
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = false,                      -- Displays the current line number instead of the current project
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    blacklist_repos     = {},                         -- A blacklist that applies to git remote repo URLs instead of folder/file names
    buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    show_time           = true,                       -- Show the timer

    editing_text        = "Open %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Looking at %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing garbage",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Configuring again (can't help it)",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s0",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})
require "nvim-treesitter.configs".setup {
    ensure_installed = {
        "asm",
        "go",
        "rust",
        "python",
        "lua",
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    }
}
require "mason"         .setup() -- Installing lsp formatters and other stuff
require "autoclose"     .setup() -- Close (, ", { and such ( annoying )
require "lualine"       .setup() -- The useless bar at the bottom
require('telescope').setup({
  defaults = {
    -- configure to use ripgrep
    vimgrep_arguments = {
      "rg",
      "--follow",        -- Follow symbolic links
      "--hidden",        -- Search for hidden files
      "--no-heading",    -- Don't group matches by each file
      "--with-filename", -- Print the file path with the matched lines
      "--line-number",   -- Show line numbers
      "--column",        -- Show column numbers
      "--smart-case",    -- Smart case search

      -- Exclude some patterns from search
      "--glob=!**/.git/*",
      "--glob=!**/.idea/*",
      "--glob=!**/.vscode/*",
      "--glob=!**/build/*",
      "--glob=!**/dist/*",
      "--glob=!**/yarn.lock",
      "--glob=!**/package-lock.json",
      "--glob=!**/node_modules/*",
    },

    ...

  },
  pickers = {
    find_files = {
      hidden = true,
      -- needed to exclude some files & dirs from general search
      -- when not included or specified in .gitignore
      find_command = {
        "rg",
        "--files",
        "--hidden",
        "--glob=!**/.git/*",
        "--glob=!**/.idea/*",
        "--glob=!**/.vscode/*",
        "--glob=!**/build/*",
        "--glob=!**/dist/*",
        "--glob=!**/yarn.lock",
        "--glob=!**/package-lock.json",
        "--glob=!**/node_modules/*",
      },
    },
  },
})

local lspconfig = require("lspconfig")
lspconfig.pyright.setup({})
lspconfig.gopls.setup({})
lspconfig.html.setup({})
lspconfig.svelte.setup({})
lspconfig.tsserver.setup({})
lspconfig.intelephense.setup({})
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'},
      },
    },
  },
}


local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
    settings = {
      ["rust-analyzer"] = {
        cargo = { allFeatures = true },
        procMacro = { enable = true },
        checkOnSave = { command = "clippy" },
      },
    },
  },
})

-- LSP Diagnostics Options Setup 
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

-- sign({name = 'DiagnosticSignError', text = ''})
-- sign({name = 'DiagnosticSignWarn', text = ''})
-- sign({name = 'DiagnosticSignHint', text = ''})
-- sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = {
        prefix = "!",
        spacing = 8,
        source = "always",
        severity = {
            min = vim.diagnostic.severity.WARN,
        },
    },
    -- signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
    float = {
        style = "minimal",
        -- border = {"a", "b", "c", "d"},
        source = 'always',
        -- header = '',
        -- prefix = '+',
        scope = "line",
        -- focus = true,
        show_header = true,
    },
})

-- vim.cmd([[
-- set signcolumn=yes
-- autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
-- ]])



require("prettier").setup({
	bin = 'prettierd'
})

local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
      }),
  },
  sources = {
    { name = 'path' },                              -- file paths
    { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
    { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
    { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
    { name = 'buffer', keyword_length = 2 },        -- source current buffer
    { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
    { name = 'calc'},                               -- source for math calculation
    { name = "luasnip"},
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
          local menu_icon ={
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
          }
          item.menu = menu_icon[entry.source.name]
          return item
      end,
  },
})

-- Use buffer source for '/' and '?' in cmdline
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' in cmdline
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'path' },
    { name = 'cmdline' }
  },
  matching = { disallow_symbol_nonprefix_matching = false }
})

