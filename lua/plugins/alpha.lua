return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
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
  end,
}
