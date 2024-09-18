return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        -- Custom ASCII logo to display on the dashboard
        local logo = [[
         █████╗ ██╗     ███████╗██╗  ██╗██╗   ██╗███████╗
        ██╔══██╗██║     ██╔════╝╚██╗██╔╝╚██╗ ██╔╝╚══███╔╝
       ███████║██║     █████╗   ╚███╔╝  ╚████╔╝   ███╔╝
      ██╔══██║██║     ██╔══╝   ██╔██╗   ╚██╔╝   ███╔╝
        ██║  ██║███████╗███████╗██╔╝ ██╗   ██║   ███████╗
        ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝

        ]]
        require('dashboard').setup {
            -- Config with the custom header (ASCII logo)
            config = {
                header = vim.split(logo, "\n"),
                footer = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    return {"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"}
                end
            }
        }
    end,
    dependencies = {{'nvim-tree/nvim-web-devicons'}}
}
