return {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- make barbecue’s base highlight transparent
      theme = {
        normal = { bg = "NONE" },
      },
      show_modified = true,
      symbols = { separator = "  " },
    },
  },
}

