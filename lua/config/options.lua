-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- This file is automatically loaded by plugins.config

local opt = vim.opt
local options = {

  backup = false,
  clipboard = "unnamedplus", -- Sync with system clipboard
  colorcolumn = "80",
  completeopt = "menu,menuone,noselect",
  conceallevel = 0, -- Hide * markup for bold and italic
  cmdheight = 0, -- Give more space for displaying messages.
  cursorline = true, -- Enable highlighting of the current line
  errorbells = false,
  expandtab = true, -- Use spaces instead of tabs
  fileencoding = "utf-8",
  formatoptions = "jcroqlnt", -- tcqj
  grepformat = "%f:%l:%c:%m",
  grepprg = "rg --vimgrep",
  guicursor = "", -- Makes the cursor blink
  hlsearch = false, -- The highlighting on search remains (true is annoying)
  ignorecase = true, -- Ignore case
  inccommand = "nosplit", -- preview incremental substitute
  laststatus = 0,
  list = true, -- Show some invisible characters (tabs...
  ls = 0, -- Disable the command line
  incsearch = true, -- Creates new highlight when you keep typing the searches
  mouse = "a", -- Enable mouse mode
  number = true, -- Print line number
  pumblend = 10, -- Popup blend
  pumheight = 10, -- Maximum number of entries in a popup
  relativenumber = true, -- Relative line numbers
  scrolloff = 4, -- Lines of context
  sessionoptions = { "buffers", "curdir", "tabpages", "winsize" },
  shiftround = true, -- Round indent
  shiftwidth = 4, -- Size of an indent
  showmode = false, -- Dont show mode since we have a statusline
  sidescrolloff = 8, -- Columns of context
  signcolumn = "yes", -- Always show the signcolumn, otherwise it would shift the text each time
  smartcase = true, -- Don't ignore case with capitals
  smartindent = true, -- Insert indents automatically
  spelllang = { "en" },
  splitbelow = true, -- Put new windows below current
  splitright = true, -- Put new windows right of current
  swapfile = false, -- Swap files are annoying if you have a UPS or working in the cloud
  tabstop = 4, -- Number of spaces tabs count for
  termguicolors = true, -- True color support
  timeoutlen = 300,
  undofile = true,
  undolevels = 10000,
  updatetime = 200, -- Save swap file and trigger CursorHold
  wildmode = "longest:full,full", -- Command-line completion mode
  winminwidth = 5, -- Minimum window width
  wrap = false, -- Disable line wrap
}

for k, v in pairs(options) do -- This for loop is just a fancy way to set the options
  vim.opt[k] = v -- Allows you to set the options without typing vim.opt.
end

if vim.fn.has("nvim-0.9.0") == 1 then
  opt.splitkeep = "screen"
  opt.shortmess:append({ C = true })
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
