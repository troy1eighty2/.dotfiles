return {
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        }
    },
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        'https://github.com/neovim/nvim-lspconfig'
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            dashboard = {
                enabled = true,
                sections = {
                    {
                        header = {
                            [[                                                                   
      ████ ██████           █████      ██                     
     ███████████             █████                             
     █████████ ███████████████████ ███   ███████████   
    █████████  ███    █████████████ █████ ██████████████   
   █████████ ██████████ █████████ █████ █████ ████ █████   
 ███████████ ███    ███ █████████ █████ █████ ████ █████  
██████  █████████████████████ ████ █████ █████ ████ ██████ 
]],
                        },
                    },
                    { section = "keys", padding = 1, gap = 1},
                    { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1},
                },
            },
            explorer = { enabled = true, },
            indent = { enabled = true },
            input = { enabled = true },
            picker = { enabled = true,
            layout = { layout = { position = "right" } },
            sources = {
                explorer = {
                    hidden = true,
                },
            },
        },
            notifier = { enabled = true },
            -- quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            -- words = { enabled = true },
        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
    },
    { "nvim-tree/nvim-web-devicons", opts = {} },
    {
        'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = {
            settings ={
                save_on_toggle = true
            }
        }
    },
    {
        "NStefan002/screenkey.nvim",
        lazy = false,
        version = "*", -- or branch = "main", to use the latest commit
        config = {
            win_opts = {
                row = vim.o.lines - vim.o.cmdheight - 1,
                col = vim.o.columns - 1,
                relative = "editor",
                anchor = "SE",
                width = 20,
                height = 1,
                border = "single",
                title = "live chungus cam",
                title_pos = "center",
                style = "minimal",
                focusable = false,
                noautocmd = true,
            },
        }
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    }
}
