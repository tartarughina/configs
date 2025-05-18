return {
  -- Remove or disable the existing tokyonight theme
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },

  -- Add catppuccin theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Make sure it loads first
    opts = {
      flavour = "macchiato", -- Options: latte, frappe, macchiato, mocha
      transparent_background = false, -- Set to true if you want transparency
      term_colors = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = true,
        mini = true,
        -- For more integrations, see: https://github.com/catppuccin/nvim#integrations
      },
    },
  },

  -- Set catppuccin as the default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
