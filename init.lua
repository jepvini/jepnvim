-- My nvim config in lua
-- By  Jep
--
-- still wip as always
--
-- Dependencies:
--
-- nix -> for lazy-lsp
-- $ curl -L https://nixos.org/nix/install | sh
--
-- shellcheck -> for bashls
-- # apt install shellcheck
--
-- english dictionary
-- install aspell
-- # apt install aspell aspell-en
--
-- pipe it to a location
-- $ aspell -d en dump master | aspell -l en expand > my.dict

--------------------------------------------------

-- vim.opt settings

--------------------------------------------------

-- Line numbers
vim.opt.number = true

-- Relative numbers
vim.wo.relativenumber = true

-- Ignore case in search
vim.opt.ignorecase = true

-- Search upper case
vim.opt.smartcase = true

-- Remove previous search highlihts
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Remove signline
vim.opt.signcolumn = "no"

-- Long lines wrapped
vim.opt.wrap = true

-- Preserve indentation with wrapped lines
vim.opt.breakindent = true

-- Tab size
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Indent size
vim.opt.shiftwidth = 2

-- Tab are spaces
vim.opt.expandtab = true

-- always have min 8 lines from cursor and end of screen
vim.opt.scrolloff = 8

-- use undotree for undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- No mouse in insert mode
vim.opt.mouse = "n"

-- For modicator
vim.o.termguicolors = true
vim.o.cursorline = true

-- Fat cursor
vim.opt.guicursor = ""

-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

----------------------------------------------------

-- Keybindings

----------------------------------------------------

-- Leader
vim.g.mapleader = " "

-- jk as esc
vim.keymap.set({ "i" }, "jk", "<esc>")

-- Save file
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")

-- Quit file
vim.keymap.set("n", "<leader>q", "<cmd>exit<cr>")

-- Move half page
vim.keymap.set("n", "J", "<C-d>zz")
vim.keymap.set("n", "K", "<C-u>zz")

-- Copy and paste to/from keyboard
vim.keymap.set({ "n", "x", "v" }, "cp", '"+y')
vim.keymap.set({ "n", "x", "v" }, "cv", '"+p')

--- Delete does not change internal register
vim.keymap.set({ "n", "x", "v" }, "x", '"_x')

-- Move visual selecyed lines
vim.keymap.set("v", "J", ":m '>+1<CR> gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR> gv=gv")

-- Search terms stau in the middle
vim.keymap.set("n", "n", "nzzzd")
vim.keymap.set("n", "N", "Nzzzd")

-- Replace without touching the buffer
vim.keymap.set("x", "<leader>p", '"_dP')

-- Sort selected text
vim.keymap.set("v", "<leader>S", ":sort<cr>")

-- Select whole buffe
vim.keymap.set("n", "<leader>A", ":keepjumps normal! ggVG<cr>")

-- Tabs
vim.keymap.set("n", "<leader>h", "<cmd>tabn 3<cr>") -- tab 1
vim.keymap.set("n", "<leader>j", "<cmd>tabn 1<cr>") -- tab 2
vim.keymap.set("n", "<leader>k", "<cmd>tabn 2<cr>") -- tab 3
vim.keymap.set("n", "<leader>l", "<cmd>tabn 4<cr>") -- tab 4

-- Show registers
vim.keymap.set("n", "<leader>R", "<cmd>registers<cr>")

-- Disable scroll in insert mode
vim.keymap.set("i", "<Up>", "<nop>")
vim.keymap.set("i", "<Down>", "<nop>")
vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")
vim.keymap.set("v", "<Up>", "<nop>")
vim.keymap.set("v", "<Down>", "<nop>")

-- Toggle first letter of word upper case or lower case
vim.keymap.set("n", "<leader>U", "viWo<esc>gUl")
vim.keymap.set("n", "<leader>u", "viWo<esc>gul")

----------------------------------------------------

-- Plugins

----------------------------------------------------
local lazy = {}

function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print("Installing lazy.nvim....")
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			path,
		})
	end
end

function lazy.setup(plugins)
	-- You can "comment out" the line below after lazy.nvim is installed
	lazy.install(lazy.path)

	vim.opt.rtp:prepend(lazy.path)
	require("lazy").setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
lazy.opts = {}

-- Plugin space

lazy.setup({
	-- Themes
	{ "ellisonleao/gruvbox.nvim", priority = 1000 },
	{ "folke/tokyonight.nvim", priority = 10000 },
	{ "rebelot/kanagawa.nvim", priority = 1000 },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	-- Various
	{ "LnL7/vim-nix" }, -- better support for nix
	{ "stevearc/oil.nvim" }, -- file manager
	{ "RRethy/vim-illuminate" }, -- illuminate same word as cursor
	{ "akinsho/toggleterm.nvim" }, -- terminal
	{ "editorconfig/editorconfig-vim" },
	{ "kyazdani42/nvim-tree.lua" }, -- file manager
	{ "lukas-reineke/indent-blankline.nvim" }, -- indent blankline
	{ "ThePrimeagen/vim-be-good" }, -- game
	{ "mbbill/undotree" }, -- better undo
	{ "norcalli/nvim-colorizer.lua" }, -- color over #999999
	{ "numToStr/Comment.nvim" }, -- comment with leader cc
	{ "nvim-lualine/lualine.nvim" }, -- status line theme
	{ "nvim-telescope/telescope.nvim", tag = "0.1.2", dependencies = { "nvim-lua/plenary.nvim" } }, -- used by other plugins
	{ "nvim-tree/nvim-web-devicons" }, -- icons
	{ "nvim-treesitter/nvim-treesitter" }, -- fuzzy search
	{ "pocco81/auto-save.nvim" }, -- auto save
	{ "stevearc/conform.nvim" }, -- formatter
	{ "tpope/vim-repeat" }, -- better .
	{ "tpope/vim-surround" }, -- adds the command surround
	{ "wellle/targets.vim" }, -- surround
	{ "zhimsel/vim-stay" }, -- cursor stays in place on file closing and reopening

	-- StartUp
	{ "startup-nvim/startup.nvim" }, -- startup page

	-- Lsp zero
	{
		{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },

		-- LSP Support
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				{ "hrsh7th/cmp-nvim-lsp" },
			},
		},

		-- Autocompletion
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				{
					"L3MON4D3/LuaSnip",
					dependencies = { "rafamadriz/friendly-snippets" },
				},
				{ "hrsh7th/cmp-buffer" }, -- buffer
				{ "hrsh7th/cmp-nvim-lsp" }, -- Lsp
				{ "saadparwaiz1/cmp_luasnip" }, -- snippets command
				{ "uga-rosa/cmp-dictionary" }, -- dictionary auto
				{ "FelipeLema/cmp-async-path" }, -- path outo asynchronous
			},
		},
	},
})

-- Plugin config

-- require("catppuccin").setup({
-- 	flavour = "macchiato", -- latte, frappe, macchiato, mocha
-- 	background = { -- :h background
-- 		light = "latte",
-- 		dark = "mocha",
-- 	},
-- 	transparent_background = true,
-- })
--
-- -- setup must be called before loading
-- vim.cmd.colorscheme("catppuccin")

-- Tokyonight
-- vim.opt.termguicolors = true
-- vim.cmd.colorscheme('tokyonight')

-- Gruvbox
-- vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])

-- Kanagawa
require("kanagawa").setup({
	background = { -- map the value of 'background' option to a theme
		dark = "wave", -- try "dragon" !
		light = "lotus",
	},
})

vim.cmd.colorscheme("kanagawa")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#C8C093" })

-- Lualine
vim.opt.showmode = false

require("lualine").setup({
	options = {
		theme = "auto",
		icons_enabled = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = { "NvimTree" },
		},
	},
})

-- Nvim web devicons
require("nvim-web-devicons").setup({})

-- Indent-Blankline
vim.opt.list = true
vim.opt.listchars:append("eol:↴")

require("ibl").setup({
	debounce = 100,
	indent = { char = "|" },
	whitespace = { highlight = { "Whitespace", "NonText" } },
	scope = { exclude = { language = { "lua" } } },
})

-- Treesitter
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"ini",
		"json",
		"latex",
		"lua",
		"markdown",
		"nix",
		"python",
		"rust",
		"yaml",
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			scope_incremental = "<CR>",
			node_incremental = "<TAB>",
			node_decremental = "<S-TAB>",
		},
	},
})

-- Targets
vim.g.targets_aiAI = "aiAI"

-- Comment
require("Comment").setup({
	toggler = {
		-- Line-comment toggle keymap
		line = "<leader>c",
		-- Block-comment toggle keymap
		block = "<leader>bc",
	},
	opleader = {
		-- Line-comment keymap
		line = "<leader>c",
		-- Block-comment keymap
		block = "<leader>b",
	},
	extra = {
		-- Add comment at the end of line
		eol = "<leader>a",
	},
})

-- Nvim tree

local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "<CR>", api.node.open.tab, opts("Expand folder or go to file"))
	vim.keymap.set("n", "L", api.node.open.tab, opts("Expand folder or go to file"))
	vim.keymap.set("n", "H", api.node.navigate.parent_close, opts("Close parent folder"))
	vim.keymap.set("n", "gh", api.tree.toggle_hidden_filter, opts("Toggle hiddem files"))
end

require("nvim-tree").setup({
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	on_attach = my_on_attach,
})
--
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>")

-- Telescope
require("telescope").setup({
	pickers = {
		oldfiles = {
			mappings = {
				i = {
					["<cr>"] = "select_tab",
				},
				n = {
					["<cr>"] = "select_tab",
				},
			},
		},
		find_files = {
			mappings = {
				i = {
					["<cr>"] = "select_tab",
				},
				n = {
					["<cr>"] = "select_tab",
				},
			},
		},
		live_grep = {
			mappings = {
				i = {
					["<cr>"] = "select_tab",
				},
				n = {
					["<cr>"] = "select_tab",
				},
			},
		},
	},
})

vim.keymap.set("n", "<leader>r", "<cmd>Telescope oldfiles<cr>")
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>")

-- Toggleterminal
require("toggleterm").setup({
	open_mapping = "<C-t>",
	direction = "horizontal",
	shade_terminals = true,
})

-- Colorizer
require("colorizer").setup()

-- Illuminate
require("illuminate").configure({})

-- Formatter
require("conform").setup({
	vim.api.nvim_create_user_command("Format", function(args)
		local range = nil
		if args.count ~= -1 then
			local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
			range = {
				start = { args.line1, 0 },
				["end"] = { args.line2, end_line:len() },
			}
		end
		require("conform").format({ async = true, lsp_fallback = true, range = range })
	end, { range = true }),

	formatters_by_ft = {
		c = { "clang_format" },
		cpp = { "clang_format" },
		json = { "jq" },
		lua = { "stylua" },
		nix = { "alejandra" },
		python = { "isort", "black" },
		sh = { "shellharden" },

		["*"] = { "codespell", "trim_whitespace", "trim_newlines" },
	},
})

vim.keymap.set("n", "<leader>g", vim.cmd.Format)

-- Undotree
vim.keymap.set("n", "<leader>p", vim.cmd.UndotreeToggle)

-- Auto save
vim.api.nvim_set_keymap("n", "<leader>s", ":ASToggle<CR>", {})

-- OilVim
require("oil").setup({
	default_file_explorer = true,
	keymaps = {
		["<CR>"] = "actions.select_tab",
		["L"] = "actions.select",
		["H"] = "actions.parent",
	},
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Plugins end

----------------------------------------------------

-- StartUp

----------------------------------------------------

require("startup").setup({ theme = "startify" })

----------------------------------------------------

-- LSP servers with lsp_zero

----------------------------------------------------

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local cmp_format = require("lsp-zero").cmp_format()

-- load snippets from the snip folder
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snip/" } })
-- require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	formatting = cmp_format,
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<Tab>"] = cmp_action.luasnip_supertab(),
		["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "async_path" },
		{ name = "buffer" },
		{
			name = "dictionary",
			keyword_length = 3,
		},
	},

	preselect = "none",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
})

require("lspconfig").bashls.setup({})
require("lspconfig").clangd.setup({})
require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
		},
	},
})
require("lspconfig").nil_ls.setup({})
require("lspconfig").pyright.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").yamlls.setup({})
