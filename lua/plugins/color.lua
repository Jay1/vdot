return {

  {
    "catppuccin",
    opts = {
      priority = 1000,
      flavour = "mocha",
      transparent_background = true,
      default_integration = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        noice = true,
        notifier = true,
        which_key = true,
        telescope = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
-- {
--   "folke/tokyonight.nvim",
--   lazy = true,
--   opts = { transparent = "true" },
-- },
