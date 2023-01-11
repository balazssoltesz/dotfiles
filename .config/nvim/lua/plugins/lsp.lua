return {

  -- uncomment and add lsp servers with their config to servers below
  {
    "neovim/nvim-lspconfig",
    -- you can do any additional lsp server setup here
    -- return true if you don't want this server to be setup with lspconfig
    ---@param server string lsp server name
    ---@param opts _.lspconfig.options any options set for the server
    -- setup_server = function(server, opts)
    --   return false
    -- end,
    ---@type lspconfig.options
    opts = {
      servers = {
        jsonls = {},
        sumneko_lua = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        -- eslint = {},
        html = {},
        tsserver = {},
        dockerls = {},
        cssls = {},
        bashls = {},
        -- eslint = {
        --   codeAction = {
        --     disableRuleComment = {
        --       enable = true,
        --       location = "separateLine",
        --     },
        --     showDocumentation = {
        --       enable = true,
        --     },
        --   },
        --   codeActionOnSave = {
        --     enable = false,
        --     mode = "all",
        --   },
        --   experimental = {
        --     useFlatConfig = false,
        --   },
        --   format = false,
        --   nodePath = "",
        --   onIgnoredFiles = "off",
        --   packageManager = "npm",
        --   problems = {
        --     shortenToSingleLine = false,
        --   },
        --   quiet = false,
        --   rulesCustomizations = {},
        --   run = "onType",
        --   useESLintClass = false,
        --   validate = "on",
        --   workingDirectory = {
        --     mode = "location",
        --   },
        -- },
      },
      setup = {
        -- example to setup with typescript.nvim
        -- tsserver = function(_, opts)
        --   require("typescript").setup({ server = opts })
        --   return true
        -- end,
        -- Specify * to use this function as a fallback for any server
        ["*"] = function(server, opts)
          local config = {
            virtual_text = false, -- disable virtual text
            update_in_insert = true,
            underline = true,
            severity_sort = true,
            float = {
              focusable = true,
              style = "minimal",
              border = "rounded",
              source = "always",
              header = "",
              prefix = "",
            },
          }

          vim.diagnostic.config(config)
        end,
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      nls.setup({
        debug = false,
        log_level = "error",
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.eslint_d,
          nls.builtins.code_actions.eslint_d,
          nls.builtins.formatting.prettierd.with({
            filetypes = { "markdown", "typescriptreact", "typescript", "javascript", "javascriptreact" }, -- only runs `deno fmt` for markdown
          }),
          -- require("typescript.extensions.null-ls.code-actions"),
        },
      })
    end,
  },
  -- uncomment and add tools to ensure_installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "typescript-language-server",
        "prettierd",
      },
    },
  },
  -- {
  --   "jayp0521/mason-null-ls.nvim",
  --   dependencies = {
  --     "williamboman/mason.nvim",
  --     "jose-elias-alvarez/null-ls.nvim",
  --   },
  --   after = "mason.nvim",
  --   config = function()
  --     require("mason-null-ls").setup({
  --       automatic_installation = true,
  --     })
  --   end,
  -- },
  {
    "MunifTanjim/eslint.nvim",
    opts = {
      bin = "eslint_d", -- or `eslint_d`
      code_actions = {
        enable = true,
        apply_on_save = {
          enable = true,
          types = { "directive", "problem", "suggestion", "layout" },
        },
        disable_rule_comment = {
          enable = true,
          location = "separate_line", -- or `same_line`
        },
      },
      diagnostics = {
        enable = true,
        report_unused_disable_directives = false,
        run_on = "type", -- or `save`
      },
    },
  },
}
