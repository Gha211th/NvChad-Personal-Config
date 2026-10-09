require("nvchad.configs.lspconfig").defaults()
local capabilities = require("cmp_nvim_lsp").default_capabilities()
--local lspconfig = require "lspconfig"

vim.lsp.config("dartls", {
  cmd = { "dart", "language-server", "--protocol=lsp" },
  filetypes = { "dart" },
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = true,
    outline = true,
    suggestFromUnimportedLibraries = true,
  },
  root_markers = { "pubspec.yaml" },
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true,
    },
  },
  on_attach = function()
    print "dartls is activated!"
  end,
})

vim.lsp.config("ts_ls", {
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  capabilities = capabilities,
  init_options = {
    hostInfo = "neovim",
  },
  on_attach = function()
    print "ts_ls is activated"
  end,
})

vim.lsp.config("pyright", {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = {
    "pyrightconfig.json",
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    ".git",
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
      },
    },
  },
  on_attach = function()
    print "pyright is activated!"
  end,
})

vim.lsp.config("tailwindcss", {
  filetypes = { "html", "css", "scss", "javascript", "typescript", "javascriptreact", "typescriptreact" },
  root_markers = {
    "tailwind.config.ts",
    "tailwind.config.ts",
    "vite.config.ts",
    "vite.config.js",
    ".git",
    "package.json",
  },
  init_options = {
    html = "html",
  },
  on_attach = function()
    print "tailwindcss is activated"
  end,
})

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      lens = {
        debug = {
          enable = true,
        },
        enable = true,
        implementations = {
          enable = true,
        },
        references = {
          adt = {
            enable = true,
          },
          enumVariant = {
            enable = true,
          },
          method = {
            enable = true,
          },
          trait = {
            enable = true,
          },
        },
        run = {
          enable = true,
        },
        updateTest = {
          enable = true,
        },
      },
    },
  },
  capabilities = {
    experimental = {
      commands = {
        commands = { "rust-analyzer.showReferences", "rust-analyzer.runSingle", "rust-analyzer.debugSingle" },
      },
      serverStatusNotification = true,
    },
  },
  filetypes = { "rust" },
  cmd = { "rust_analyzer" },
  on_attach = function()
    print "rust_analyzer is activated"
  end,
})

local servers = { "html", "cssls" }
vim.lsp.enable(servers)
vim.lsp.enable "dartls"
vim.lsp.enable "ts_ls"
vim.lsp.enable "pyright"
vim.lsp.enable "tailwindcss"
vim.lsp.enable "rust_analyzer"

-- read :h vim.lsp.config for changing options of lsp servers
