return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  priority = 900, -- lower than themes (1000), so lualine loads after them

  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        globalstatus = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        icons_enabled = true,
      },
      sections = {
        lualine_a = {
          {
            "mode",
            separator = { left = "", right = "" }, -- add right arrow
            right_padding = 2,
          },
        },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {
          { "encoding" },
          { "fileformat" },
          { "filetype", icon_only = false },
        },
        lualine_y = { "progress" },
        lualine_z = {
          { "location", separator = { left = "", right = "" }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "nvim-tree", "lazy", "mason", "quickfix" },
    })
  end,
}
