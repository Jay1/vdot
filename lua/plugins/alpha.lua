return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local dashboard = require("alpha.themes.dashboard")
    local icons = require("nvim-web-devicons")

    local function get_extension(fn)
      local match = fn:match("^.+(%..+)$")
      local ext = ""
      if match ~= nil then
        ext = match:sub(2)
      end
      return ext
    end

    local function icon(fn)
      local nwd = require("nvim-web-devicons")
      local ext = get_extension(fn)
      return nwd.get_icon(fn, ext, { default = true })
    end

    local function file_button(fn, sc, short_fn)
      short_fn = short_fn or fn
      local ico, hl = icon(fn)
      local ico_txt = ico and (ico .. "  ") or ""
      local file_button_el = dashboard.button(sc, ico_txt .. short_fn, "<cmd>e " .. fn .. " <CR>")

      file_button_el.opts.hl = file_button_el.opts.hl or {}

      local fn_start = short_fn:match(".*[/\\]")
      if fn_start ~= nil then
        table.insert(file_button_el.opts.hl, { "Comment", #ico_txt, #fn_start + #ico_txt })
      end

      if hl then
        table.insert(file_button_el.opts.hl, { hl, 0, #ico_txt - 1 })
      end

      return file_button_el
    end

    local default_mru_ignore = { "gitcommit" }

    local mru_opts = {
      ignore = function(path, ext)
        return (string.find(path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext))
      end,
    }

    --- @param start number
    --- @param cwd string optional
    --- @param items_number number optional number of items to generate, default = 10
    local function mru(start, cwd, items_number, opts)
      opts = opts or mru_opts
      items_number = items_number or 5 -- Changed to 5 most recent files

      local oldfiles = {}
      for _, v in pairs(vim.v.oldfiles) do
        if #oldfiles == items_number then
          break
        end
        local cwd_cond
        if not cwd then
          cwd_cond = true
        else
          cwd_cond = vim.startswith(v, cwd)
        end
        local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
        if (vim.fn.filereadable(v) == 1) and cwd_cond and not ignore then
          oldfiles[#oldfiles + 1] = v
        end
      end

      local tbl = {}
      for i, fn in ipairs(oldfiles) do
        local short_fn
        if cwd then
          short_fn = vim.fn.fnamemodify(fn, ":.")
        else
          short_fn = vim.fn.fnamemodify(fn, ":~")
        end
        local file_button_el = file_button(fn, tostring(i + start - 1), short_fn)
        tbl[i] = file_button_el
      end
      return {
        type = "group",
        val = tbl,
        opts = {},
      }
    end

    local logo = [[
     ____        _   _   _          _        _   _             
    |  _ \      | | | | | |        | |      | | (_)            
    | |_) | __ _| |_| |_| | ___ ___| |_ __ _| |_ _  ___  _ __  
    |  _ < / _` | __| __| |/ _ / __| __/ _` | __| |/ _ \/ |_ \ 
    | |_) | (_| | |_| |_| |  __\__ | || (_| | |_| | (_) | | | |
    |____/ \__,_|\__|\__|_|\___|___/\__\__,_|\__|_|\___/|_| |_|

                A leader is a dealer in hope.               
    ]]

    dashboard.section.header.val = vim.split(logo, "\n", { trimempty = true })
    dashboard.section.buttons.val = {
      dashboard.button("p", "📁 " .. "Open project", "<cmd>Telescope project display_type=full<cr>"),
      dashboard.button("e", "🍃 " .. "New file", "<cmd>ene <BAR> startinsert<cr>"),
      dashboard.button("f", "🔍 " .. "Find file", ":Telescope find_files <CR>"),
      dashboard.button("r", "⏳ " .. "Recent files", "<CMD>Telescope oldfiles<cr>"),
      dashboard.button("c", "💿 " .. "Config", ":e $MYVIMRC | :cd %:p:h | Telescope find_files<cr>"),
      dashboard.button("l", "🩷 " .. "Lazy", "<cmd>Lazy<cr>"),
      dashboard.button("v", "💙 " .. "LazyExtras", "<cmd>LazyExtras<cr>"),
      dashboard.button("m", "🧱 " .. "Mason", "<cmd>Mason<cr>"),
      dashboard.button("q", "❌ " .. "Quit", "<cmd>qa<cr>"),
    }

    local section = {
      header = dashboard.section.header,
      buttons = dashboard.section.buttons,
      mru = {
        type = "group",
        val = {
          {
            type = "text",
            val = "Recent files",
            opts = {
              hl = "SpecialComment",
              shrink_margin = false,
              position = "center",
            },
          },
          { type = "padding", val = 1 },
          {
            type = "group",
            val = function()
              return { mru(0, vim.fn.getcwd()) }
            end,
            opts = { shrink_margin = false },
          },
        },
      },
      footer = {
        type = "text",
        val = "The best way to predict the future is to create it.",
        opts = {
          position = "center",
          hl = "Comment",
        },
      },
    }

    local opts = {
      layout = {
        { type = "padding", val = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }) },
        section.header,
        { type = "padding", val = 2 },
        section.buttons,
        section.mru,
        { type = "padding", val = 1 },
        section.footer,
        { type = "padding", val = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }) },
      },
      opts = {
        margin = 5,
        redraw_on_resize = true,
        setup = function()
          vim.api.nvim_create_autocmd("DirChanged", {
            pattern = "*",
            group = "alpha_temp",
            callback = function()
              require("alpha").redraw()
            end,
          })
        end,
      },
    }

    require("alpha").setup(opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "alpha",
      callback = function()
        vim.opt_local.foldenable = false
        vim.opt_local.colorcolumn = ""
      end,
    })
  end,
}
