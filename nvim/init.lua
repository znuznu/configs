-- Leader setup
vim.g.mapleader = ","

-- imports
require("plugins")
require("options")
require("keys")

-- Mason setup
require("mason").setup(
    {
        ui = {
            icons = {
                package_installed = "",
                package_pending = "",
                package_uninstalled = ""
            }
        }
    }
)
require("mason-lspconfig").setup({
	ensure_installed = {
		'rust_analyzer',
		'cssls',
		'cssmodules_ls',
		'eslint',
		'tsserver',
		'prismals',
	}
})

-- Rust setup
local rt = require("rust-tools")

rt.setup(
    {
        server = {
            on_attach = function(_, bufnr)
                -- Hover actions
                vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, {buffer = bufnr})
                -- Code action groups
                vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, {buffer = bufnr})
            end
        }
    }
)
-- TypeScript setup
require("typescript").setup(
    {
        disable_commands = false,
        debug = false,
        go_to_source_definition = {
            fallback = true
        }
    }
)

-- null_ls setup
local null_ls = require("null-ls")

-- Avoiding LSP formatting conflicts
local lsp_formatting = function(bufnr)
    vim.lsp.buf.format(
        {
            filter = function(client)
                return client.name == "null-ls"
            end,
            bufnr = bufnr
        }
    )
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
        vim.api.nvim_create_autocmd(
            "BufWritePre",
            {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    lsp_formatting(bufnr)
                end
            }
        )
    end
end

null_ls.setup(
    {
        on_attach = on_attach,
        sources = {
            null_ls.builtins.diagnostics.eslint_d.with(
                {
                    diagnostics_format = "[eslint] #{m}\n(#{c})"
                }
            ),
            null_ls.builtins.diagnostics.fish,
            require("typescript.extensions.null-ls.code-actions")
        }
    }
)

-- Prettier setup
require("prettier").setup(
    {
        bin = "prettierd",
        filetypes = {
            "css",
            "graphql",
            "html",
            "javascript",
            "javascriptreact",
            "json",
            "less",
            "markdown",
            "scss",
            "typescript",
            "typescriptreact",
            "yaml"
        }
    }
)

-- Eslint setup
require("eslint").setup(
    {
        bin = "eslint_d",
        code_actions = {
            enable = true,
            apply_on_save = {
                enable = true,
                types = {"directive", "problem", "suggestion", "layout"}
            },
            disable_rule_comment = {
                enable = true,
                location = "separate_line"
            }
        },
        diagnostics = {
            enable = true,
            report_unused_disable_directives = false,
            run_on = "type"
        }
    }
)

-- Indent setup

require("indent_blankline").setup({
    use_treesitter = true,
    use_treesitter_scope = true,
    show_first_indent_level = true,
})

-- Completion plugin setup
local cmp = require "cmp"
cmp.setup(
    {
        -- Enable LSP snippets
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end
        },
        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            -- Add tab support
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<C-S-f>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm(
                {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true
                }
            )
        },
        -- Installed sources:
        sources = {
            {name = "path"}, -- file paths
            {name = "nvim_lsp", keyword_length = 3}, -- from language server
            {name = "nvim_lsp_signature_help"}, -- display function signatures with current parameter emphasized
            {name = "nvim_lua", keyword_length = 2}, -- complete neovim's Lua runtime API such vim.lsp.*
            {name = "buffer", keyword_length = 2}, -- source current buffer
            {name = "vsnip", keyword_length = 2}, -- nvim-cmp source for vim-vsnip
            {name = "calc"} -- source for math calculation
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered()
        },
        formatting = {
            fields = {"menu", "abbr", "kind"},
            format = function(entry, item)
                local menu_icon = {
                    nvim_lsp = "λ",
                    vsnip = "⋗",
                    buffer = "Ω",
                    path = "🖫"
                }
                item.menu = menu_icon[entry.source.name]
                return item
            end
        }
    }
)

-- Treesitter plugin setup
require("nvim-treesitter.configs").setup {
    ensure_installed = {"lua", "rust", "toml", "typescript", "json", "css", "html", "tsx"},
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    ident = {enable = true},
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil
    },
    autotag = {
        enable = true
    },
    live_filter = {
	always_show_folders = false,
    }
}

------------------
-- Telescope setup
require("telescope").setup(
    {
        defaults = {
            layout_config = { height = 0.95, width = 0.95 },
        }
    }
)
require("telescope").load_extension("fzf")

-- Tree setup --

-- disable netrw at the very start init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup()
require("nvim-web-devicons").setup()

-- Autopairs setup
require("nvim-autopairs").setup {}

-- Comment setup
require("Comment").setup()

-- TODO comments setup
require("todo-comments").setup()

-- Lualine setup
require('lualine').setup()

-- barbar setup --
require('bufferline').setup({
	animation = false,
})

-- git conflict setup
require('git-conflict').setup()

-- trouble setup
require("trouble").setup {
	 position = "right",
	 width = 50, 
	 icons = true,
}

-- gitsigns setup
require('gitsigns').setup {} 

-- Prisma ORM setup
require('lspconfig').prismals.setup {}

-- CSS setup
require('lspconfig').cssls.setup {}
require('lspconfig').cssmodules_ls.setup {}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

--------------
-- Theme setup
vim.cmd [[colorscheme moonfly]]
