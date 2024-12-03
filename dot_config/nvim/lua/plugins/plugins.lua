return {
    {
        "LazyVim/LazyVim",
        opts = {
            -- colorscheme = "rose-pine",
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            -- add a keymap to browse plugin files
            -- stylua: ignore
            {
                "<leader>fp",
                function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
                desc = "Find Plugin File",
            },
            -- add a keymap to browse cwd files using <loader> space
            -- stylua: ignore
            {
                "<leader><space>",
                function() require("telescope.builtin").find_files({ cwd = vim.fn.getcwd() }) end,
                desc = "Find CWD File",
            },
        },
        -- change some options
        opts = {
            defaults = {
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                winblend = 0,
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "go",
                "gomod",
                "gowork",
                "gosum",
                "hcl",
                "html",
                "javascript",
                "json",
                "just",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "rust",
                "terraform",
                "tsx",
                "typescript",
                "vim",
                "yaml",
                "zig",
            },
        },
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "ast-grep",
                "bash-language-server",
                "codespell",
                "flake8",
                "gitlab-ci-ls",
                "gitleaks",
                "golangci-lint",
                "golangci-lint-langserver",
                "gopls",
                "hadolint",
                "helm-ls",
                "lua-language-server",
                "pyright",
                "python-lsp-server",
                -- "rust-analyzer",
                "shellcheck",
                "shfmt",
                "shfmt",
                "stylua",
                "terraform-ls",
                "tflint",
                "typescript-language-server",
                "yaml-language-server",
                "zls",
            },
        },
    },
    {
        'neovim/nvim-lspconfig',
        opts = {
          setup = {
            rust_analyzer = function()
              return true
            end,
          },
        },
    },
    {
        "jiaoshijie/undotree",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
        keys = { -- load the plugin only when using it's keybinding:
            {
                "<leader>U",
                "<cmd>lua require('undotree').toggle()<cr>",
                desc = "Toggle undotree",
            },
        },
    },
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        }
    },
    {
        "folke/zen-mode.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    'tpope/vim-fugitive',
}
