local home = os.getenv('HOME')
local jdtls = require('jdtls')

-- File types that signify a Java project's root directory
local root_markers = {'gradlew', 'mvnw', '.git'}
local root_dir = require('jdtls.setup').find_root(root_markers)

-- Eclipse workspace folder
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

-- Helper function for creating keymaps
local function nnoremap(rhs, lhs, bufopts, desc)
  bufopts.desc = desc
  vim.keymap.set("n", rhs, lhs, bufopts)
end

-- The on_attach function for setting keymaps after the LSP attaches
local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  nnoremap('gD', vim.lsp.buf.declaration, bufopts, "Go to declaration")
  nnoremap('gd', vim.lsp.buf.definition, bufopts, "Go to definition")
  nnoremap('gi', vim.lsp.buf.implementation, bufopts, "Go to implementation")
  nnoremap('K', vim.lsp.buf.hover, bufopts, "Hover text")
  nnoremap('<C-k>', vim.lsp.buf.signature_help, bufopts, "Show signature")
  nnoremap('<space>D', vim.lsp.buf.type_definition, bufopts, "Go to type definition")
  nnoremap('<space>rn', vim.lsp.buf.rename, bufopts, "Rename")
  nnoremap('<space>ca', vim.lsp.buf.code_action, bufopts, "Code actions")
  nnoremap('<space>f', function() vim.lsp.buf.format { async = true } end, bufopts, "Format file")
end

local config = {
  -- Flags for the LSP client
  flags = {
    debounce_text_changes = 80,  -- Delay in milliseconds for text change debounce
  },

  -- Function to run after the LSP attaches to a buffer
  on_attach = on_attach,  -- Attach keybindings and functions to LSP events

  -- Directory that signifies the root of the Java project
  root_dir = root_dir,  -- Automatically determined root directory based on markers

  -- LSP server settings
  settings = {
    java = {
      -- Configuration for code formatting
      format = {
        settings = {
          -- Path to the Google Java style guide XML for formatting
          url = "/.local/share/eclipse/eclipse-java-google-style.xml",
          profile = "GoogleStyle",  -- Profile name for the style guide
        },
      },

      -- Enable signature help in the editor
      signatureHelp = { enabled = true },

      -- Configure code completion options
      completion = {
        -- Favorite static members to be included in completions
        favoriteStaticMembers = {
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
        },
        -- Types to be filtered out of completions
        filteredTypes = {
          "jdk.*", "sun.*",
        },
      },
    }
  },

  -- Command to start the JDT LS server
      cmd = {
      '/usr/bin/java',
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xmx1G',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
      -- '-javaagent:' .. home .. '/.local/share/nvim/mason/packages/jdtls/lombok.jar',
      '-jar', home .. '/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',
      '-configuration', home .. '/.local/share/nvim/mason/packages/jdtls/config_mac',
      '-data', workspace_folder,
    }
}

-- Ensure the filetype is set to 'java' before starting JDTLS
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    jdtls.start_or_attach(config)
  end
})

