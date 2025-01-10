-- Options are automatically loaded before lazy.nvim startup
-- Add any additional options here

local opt = vim.opt
local g = vim.g

-- Core Editor Settings
local options = {
  -- File Handling
  backup = false, -- Disable backup files
  swapfile = false, -- Disable swap files (better with UPS or cloud storage)
  undofile = true, -- Enable persistent undo history
  undolevels = 10000, -- Maximum number of changes that can be undone
  fileencoding = "utf-8", -- Default file encoding

  -- Visual
  termguicolors = true, -- Enable true color support
  colorcolumn = "80", -- Show line length marker at 80 characters
  cursorline = true, -- Highlight the current line
  number = true, -- Show line numbers
  relativenumber = true, -- Show relative line numbers
  signcolumn = "yes", -- Always show the sign column
  wrap = true, -- Enable line wrapping
  list = true, -- Show invisible characters
  showmode = false, -- Don't show mode in command line
  pumblend = 10, -- Popup menu transparency
  conceallevel = 0, -- Show text normally, don't hide markup

  -- Editing
  expandtab = true, -- Convert tabs to spaces
  shiftwidth = 4, -- Size of an indent
  tabstop = 4, -- Number of spaces tabs count for
  smartindent = true, -- Insert indents automatically
  breakindent = true, -- Enable smart indentation
  shiftround = true, -- Round indent to multiple of shiftwidth

  -- Search
  hlsearch = false, -- Don't highlight all search results
  incsearch = true, -- Show search matches as you type
  ignorecase = true, -- Ignore case in search patterns
  smartcase = true, -- Override ignorecase if search contains capitals
  grepformat = "%f:%l:%c:%m", -- Format for grep results
  grepprg = "rg --vimgrep", -- Use ripgrep for grep command

  -- Window/Buffer
  splitbelow = true, -- Put new windows below current
  splitright = true, -- Put new windows right of current
  scrolloff = 4, -- Minimum lines to keep above/below cursor
  sidescrolloff = 8, -- Minimum columns to keep left/right of cursor
  winminwidth = 5, -- Minimum window width
  cmdheight = 0, -- Hide command line unless needed
  laststatus = 0, -- Disable status line
  ls = 0, -- Disable line status

  -- Completion
  completeopt = "menu,menuone,noselect", -- Completion options
  pumheight = 10, -- Maximum number of items in completion menu

  -- Performance
  updatetime = 200, -- Faster completion and better UX
  timeoutlen = 300, -- Time to wait for mapped sequence to complete

  -- Input
  mouse = "a", -- Enable mouse support in all modes
  clipboard = "unnamedplus", -- Use system clipboard
  formatoptions = "jcroqlnt", -- Configure auto-formatting options

  -- Session
  sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }, -- Session save options

  -- Language
  spelllang = { "en" }, -- Set spell checking language
}

-- Global vim variables
local globals = {
  markdown_recommended_style = 0, -- Disable markdown auto-indent
  snacks_animate = false, -- Disable snacks animation
  -- Add more globals here as needed
}

-- Apply all options
for k, v in pairs(options) do
  opt[k] = v
end

-- Apply all globals
for k, v in pairs(globals) do
  g[k] = v
end

-- Neovim 0.9+ specific settings
if vim.fn.has("nvim-0.9.0") == 1 then
  opt.splitkeep = "screen" -- Keep splits positioned when resizing
  opt.shortmess:append({ C = true }) -- Don't show completion messages
end
