return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gopls = {
        settings = {
          gopls = {
            gofumpt = true,
            codelenses = {
              gc_details = false, -- Don't show garbage collection details
              generate = true, -- Show "generate" options for go:generate comments
              regenerate_cgo = true, -- Show option to regenerate cgo definitions
              run_govulncheck = true, -- Show option to run vulnerability checks
              test = true, -- Show "run test" / "debug test" above test functions
              tidy = true, -- Show option to run "go mod tidy"
              upgrade_dependency = true, -- Show option to upgrade dependencies
              vendor = true, -- Show option to vendor dependencies
            },
            hints = {
              assignVariableTypes = true, -- Show type hints for assigned variables
              compositeLiteralFields = true, -- Show field names in composite literals
              compositeLiteralTypes = true, -- Show types in composite literals
              constantValues = true, -- Show values of constants
              functionTypeParameters = true, -- Show type parameters in function signatures
              parameterNames = true, -- Show parameter names in function calls
              rangeVariableTypes = true, -- Show types of range loop variables
            },
            analyses = {
              nilness = true, -- Check for redundant or impossible nil comparisons
              unusedparams = true, -- Report unused function parameters
              unusedwrite = true, -- Report unused writes to variables
              useany = true, -- Suggest using "any" instead of "interface{}"
            },
            usePlaceholders = true, -- Use placeholders for function parameters in completions
            completeUnimported = true, -- Suggest completions from unimported packages and auto-import them
            staticcheck = true, -- Enable staticcheck analyzers (additional lint checks)
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" }, -- Exclude these directories from analysis (improves performance)
            semanticTokens = true, -- Enable semantic token highlighting (more accurate syntax highlighting)
          },
        },
      },
    },
    setup = {
      gopls = function(_, opts) -- Custom setup function for gopls
        -- workaround for gopls not supporting semanticTokensProvider
        -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
        LazyVim.lsp.on_attach(function(client, _) -- Run this when gopls attaches to a buffer
          if not client.server_capabilities.semanticTokensProvider then -- Check if semantic tokens aren't properly advertised
            local semantic = client.config.capabilities.textDocument.semanticTokens -- Get semantic token capabilities
            client.server_capabilities.semanticTokensProvider = { -- Manually set up semantic tokens provider
              full = true, -- Support full document semantic token requests
              legend = { -- Define the token types and modifiers
                tokenTypes = semantic.tokenTypes, -- Use the token types from capabilities
                tokenModifiers = semantic.tokenModifiers, -- Use the token modifiers from capabilities
              },
              range = true, -- Support range-based semantic token requests
            }
          end
        end, "gopls") -- Only apply this to gopls
        -- end workaround
      end,
    },
  },
}