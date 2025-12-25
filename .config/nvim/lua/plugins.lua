return {
    -- {
        --     "folke/todo-comments.nvim",
        --     dependencies = { "nvim-lua/plenary.nvim" },
        --     opts = {},
        -- },
        {
            'numToStr/Comment.nvim',
            opts = {
                -- add any options here
            }
        },
        {
            'xiyaowong/transparent.nvim',
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
                bigfile = { enabled = true },
                dashboard = { enabled = true },
                explorer = { enabled = true },
                indent = { enabled = true },
                input = { enabled = true },
                picker = { enabled = true },
                notifier = { enabled = true },
                quickfile = { enabled = true },
                scope = { enabled = true },
                scroll = { enabled = true },
                statuscolumn = { enabled = true },
                words = { enabled = true },
            },
        },
        {
            'nvim-treesitter/nvim-treesitter',
        }

        --         {
            --   'esmuellert/nvim-eslint',
            --   config = function()
                --     require('nvim-eslint').setup({})
                --   end,
                -- }

            }
