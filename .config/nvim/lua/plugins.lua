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
        'https://github.com/neovim/nvim-lspconfig',
        lazy = false,
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
            scroll = {
                animate = {
                    duration = { step = 1, total = 200 },
                    easing = "linear",
                },
                -- faster animation when repeating scroll after delay
                animate_repeat = {
                    delay = 1, -- delay in ms before using the repeat animation
                    duration = { step = 5, total = 50 },
                    easing = "linear",
                },
            },
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
    },
    {
        "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
        lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
        dependencies = {
            -- main one
            { "ms-jpq/coq_nvim", branch = "coq" },

            -- 9000+ Snippets
            { "ms-jpq/coq.artifacts", branch = "artifacts" },


            -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
            -- Need to **configure separately**
            { 'ms-jpq/coq.thirdparty', branch = "3p" }
            -- - shell repl
            -- - nvim lua api
            -- - scientific calculator
            -- - comment banner
            -- - etc
        },
        init = function()
            vim.g.coq_settings = {
                auto_start = true, -- if you want to start COQ at startup
                -- Your COQ settings here
                display = {
                    pum = {
                        y_ratio = 0.2,
                    },
                    statusline = {
                        helo = false,
                    },
                },
                -- keymap = {
                --     recommended = false,
                -- },
            }
        end,
        config = function()
            -- Your LSP settings here
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
        dependencies = {
            -- include a picker of your choice, see picker section for more details
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            -- configuration goes here
        },
    }
}
