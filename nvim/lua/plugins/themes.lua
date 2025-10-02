return {
  {
    "ribru17/bamboo.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("bamboo").setup({})
    end,
  },

  { "Mofiqul/dracula.nvim", lazy = false, priority = 1000 },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
  },

  {
    "maxmx03/fluoromachine.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("fluoromachine").setup({
        glow = true,
        theme = "fluoromachine",
        transparent = true,
      })
    end,
  },

  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },

  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_enable_italic = true
    end,
  },

  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = true
    end,
  },

  { "loctvl842/monokai-pro.nvim", lazy = false, priority = 1000 },

  { "liuchengxu/space-vim-dark", lazy = false, priority = 1000 },
}

