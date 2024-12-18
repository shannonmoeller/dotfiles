return {
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "editorconfig/editorconfig-vim",
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
        IblScope = { fg = "#D4D4D4" },
        NeoTreeExpander = { fg = "#D4D4D4" },
        NeoTreeIndentMarker = { fg = "#222222" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
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
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
