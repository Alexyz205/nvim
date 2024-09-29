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
                    return { "⚡ Powered by Alexis Pigeon." }
                end
            }
        }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
