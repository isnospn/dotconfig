
--------------------------------------------------------
---THEME AND TRANSPARENCY
--------------------------------------------------------
-- Function to enforce transparency across common groups
local function set_transparent()
  for _, grp in ipairs({
    "Normal", "NormalNC", "NormalFloat", "SignColumn",
    "LineNr", "Folded", "EndOfBuffer", "MsgArea",
    "FloatBorder", "WinBar", "WinBarNC", 
    -- plugin UIs
    "TelescopeNormal", "TelescopeBorder",
    "WhichKeyFloat", "NvimTreeNormal", "NvimTreeNormalNC",
    "NvimTreeEndOfBuffer",
    -- barbecue.nvim
    "BarbecueNormal", "BarbecueContext", "BarbecueSeparator",
    "BarbecueEllipsis", "BarbecueModified",
    "BarbecueBasename", "BarbecueDirname",
  }) do
    vim.api.nvim_set_hl(0, grp, { bg = "none" })
  end
end
-- Re-apply transparency after ANY colorscheme is set
local aug = vim.api.nvim_create_augroup("MyTransparentBG", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  group = aug,
  callback = set_transparent,
})

-- Load your theme at the VERY end of startup, then enforce transparency again
   vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  group = aug,
  once = true,
  callback = function()
    -- Pick ONE colorscheme here
    -- vim.cmd.colorscheme("monokai-pro")
    -- vim.cmd.colorscheme("dracula")
    -- vim.cmd.colorscheme("rose-pine")
    -- vim.cmd.colorscheme("fluoromachine")
    -- vim.cmd.colorscheme("tokyonight")
    -- vim.cmd.colorscheme("everforest")
    -- vim.cmd.colorscheme("gruvbox-material")
    -- vim.cmd.colorscheme("bamboo")
    vim.cmd.colorscheme("space-vim-dark")
    -- vim.cmd.colorscheme("unokai")
    -- Some themes/plugins adjust highlights on a later tick; do one more pass.
    vim.schedule(set_transparent)
    require("lualine").setup()
  end,
})
