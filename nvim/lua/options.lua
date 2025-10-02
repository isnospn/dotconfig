-- disable netrw at the very start for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Line numbers
vim.opt.number = true         		-- absolute line numbers
vim.opt.relativenumber = true 		-- relative numbers (good for motions)

-- Tabs & indentation
vim.opt.tabstop = 2           		-- number of spaces a <Tab> counts for
vim.opt.shiftwidth = 2        		-- number of spaces for autoindent
vim.opt.expandtab = true      		-- convert tabs to spaces
vim.opt.smartindent = true    		-- smart autoindenting

-- Search
vim.opt.ignorecase = true     		-- case-insensitive search
vim.opt.smartcase = true      		-- case-sensitive if uppercase present
vim.opt.hlsearch = true       		-- highlight search matches
vim.opt.incsearch = true      		-- show matches while typing

-- UI behaviour
vim.opt.cursorline = true     		-- highlight current line
vim.opt.wrap = false          		-- don’t wrap long lines
vim.opt.scrolloff = 8         		-- keep 8 lines visible above/below cursor
vim.opt.signcolumn = "yes"    		-- always show sign column (for LSP, git, etc.)
vim.opt.showmode = false      		-- don’t show mode (handled by lualine)

-- Splits
vim.opt.splitbelow = true     		-- open horizontal splits below
vim.opt.splitright = true     		-- open vertical splits to the right

-- Clipboard
vim.opt.clipboard = "unnamedplus" 	-- use system clipboard

-- Visual settings
vim.opt.termguicolors = true  		-- Enable 24-bit colors
vim.opt.signcolumn = "yes"    		-- Always show sign column
vim.opt.colorcolumn = "90"    		-- Show column at 100 characters
vim.opt.pumheight = 40        		-- Popup menu height 
vim.opt.pumblend = 10         		-- Popup menu transparencyo

