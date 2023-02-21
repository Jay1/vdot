return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    local dashboard = require("alpha.themes.dashboard")
    local logo = [[ 
     ____        _   _   _          _        _   _             
    |  _ \      | | | | | |        | |      | | (_)            
    | |_) | __ _| |_| |_| | ___ ___| |_ __ _| |_ _  ___  _ __  
    |  _ < / _` | __| __| |/ _ / __| __/ _` | __| |/ _ \/ |_ \ 
    | |_) | (_| | |_| |_| |  __\__ | || (_| | |_| | (_) | | | |
    |____/ \__,_|\__|\__|_|\___|___/\__\__,_|\__|_|\___/|_| |_|

                A leader is a dealer in hope.               
        ]]
    opts.section.header.val = vim.split(logo, "\n", { trimempty = false })
    opts.section.buttons.val = {
      dashboard.button("p", " " .. "Open project", "<cmd>Telescope project display_type=full<cr>"),
      dashboard.button("e", " " .. "New file", "<cmd>ene <BAR> startinsert<cr>"),
      dashboard.button("f", " " .. "Find file", ":Telescope find_files <CR>"),
      dashboard.button("r", " " .. "Recent files", "<CMD>Telescope oldfiles<cr>"),
      dashboard.button("c", " " .. "Config", ":e $MYVIMRC | :cd %:p:h | Telescope find_files<cr>"),
      dashboard.button("l", "鈴" .. "Lazy", "<cmd>Lazy<cr>"),
      dashboard.button("m", " " .. "Mason", "<cmd>Mason<cr>"),
      dashboard.button("q", " " .. "Quit", "<cmd>qa<cr>"),
    }
  end,
}
