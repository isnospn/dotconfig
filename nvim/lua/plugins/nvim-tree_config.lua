return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
          icons = {
            glyphs = {
              default = "", -- Nerd Font file icon
              folder = {
                default = "",
                open = "",
                empty = "",
                empty_open = "",
              },
            },
          },
        },
        filters = {
          dotfiles = false, -- show dotfiles
        },
      }
            -- Keymap: toggle file tree
      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
  end,
}
