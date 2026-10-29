vim.cmd("set norelativenumber")
vim.cmd([[
  cnoreabbrev Q q
  cnoreabbrev QA qa
  cnoreabbrev Qa qa
  cnoreabbrev W w
  cnoreabbrev WA wa
  cnoreabbrev Wa wa
  cnoreabbrev WQ wq
  cnoreabbrev Wq wq
  cnoreabbrev WQA wqa
  cnoreabbrev WQa wqa
  cnoreabbrev Wqa wqa
]])

return {
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline",
      },
    },
  },
  {
    "Mofiqul/vscode.nvim",
    opts = {
      transparent = true,
      group_overrides = {
        IblIndent = { fg = "#222222" },
        IblScope = { fg = "#444444" },
        NeoTreeExpander = { fg = "#D4D4D4" },
        NeoTreeIndentMarker = { fg = "#222222" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        vtsls = {
          settings = {
            javascript = {
              preferences = {
                importModuleSpecifierEnding = "js",
                importModuleSpecifierPreference = "relative",
              },
            },
            typescript = {
              preferences = {
                importModuleSpecifierEnding = "js",
                importModuleSpecifierPreference = "relative",
              },
            },
          },
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        globalstatus = false,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        css = { "prettier" },
        html = { "prettier" },
        javascript = { "prettier" },
        markdown = { "prettier" },
        typescript = { "prettier" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
