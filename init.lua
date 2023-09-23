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

-- Long lines wrapped
vim.opt.wrap = true

-- Preserve indentation with wrapped lines
vim.opt.breakindent = true

-- Tab size
vim.opt.tabstop = 2

-- Indent size
vim.opt.shiftwidth = 2

-- Tab are spaces
vim.opt.expandtab = true

-- No mouse in insert mode
vim.opt.mouse = "n"

-- For modicator
vim.o.termguicolors = true
vim.o.cursorline = true

-- disable netrw at the very start of your init.lua
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

-- Copy and paste to/from keyboard
vim.keymap.set({ "n", "x", "v" }, "cp", '"+y')
vim.keymap.set({ "n", "x", "v" }, "cv", '"+p')

--- Delete does not change internal register
vim.keymap.set({ "n", "x", "v" }, "x", '"_x')

-- Sort selected text
vim.keymap.set("v", "<leader>S", ":sort<cr>")

-- Select whole buffer
vim.keymap.set("n", "<leader>a", ":keepjumps normal! ggVG<cr>")

-- Indent whole file
vim.keymap.set("n", "<leader>g", "gg=G''")

-- Tabs
vim.keymap.set("n", "<leader>tl", "<cmd>+tabnext<cr>") -- next
vim.keymap.set("n", "<leader>th", "<cmd>-tabnext<cr>") -- prev

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
	{ "folke/tokyonight.nvim", priority = 10000 },
	{ "ellisonleao/gruvbox.nvim", priority = 1000 },
	{ "rebelot/kanagawa.nvim", priority = 1000 },

	-- Various
	{ "LnL7/vim-nix" },
	{ "RRethy/vim-illuminate" },
	{ "akinsho/toggleterm.nvim" },
	{ "editorconfig/editorconfig-vim" },
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
	{ "kyazdani42/nvim-tree.lua" },
	{ "lewis6991/gitsigns.nvim" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "mawkler/modicator.nvim" },
	{ "norcalli/nvim-colorizer.lua" },
	{ "numToStr/Comment.nvim" },
	{ "nvim-lualine/lualine.nvim" },
	{ "nvim-telescope/telescope.nvim", tag = "0.1.2", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "nvim-tree/nvim-web-devicons" },
	{ "nvim-treesitter/nvim-treesitter" },
	{ "pocco81/auto-save.nvim" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-surround" },
	{ "wellle/targets.vim" },
	{ "zhimsel/vim-stay" },
	{ "stevearc/conform.nvim", opts = {} },

	-- StartUp
	{ "startup-nvim/startup.nvim" },

	-- Lsp
	{ "dundalek/lazy-lsp.nvim" },
	{ "neovim/nvim-lspconfig" },

	-- Autocomplete
	{ "hrsh7th/cmp-buffer" }, -- buffer
	{ "hrsh7th/cmp-nvim-lsp" }, -- Lsp
	{ "hrsh7th/cmp-vsnip" }, -- snips
	{ "hrsh7th/vim-vsnip-integ" }, -- snips again
	{ "rafamadriz/friendly-snippets" }, -- snippets list
	{ "hrsh7th/nvim-cmp" }, -- main
	{ "hrsh7th/vim-vsnip" }, -- snip source
	{ "uga-rosa/cmp-dictionary" }, -- dictionary auto
	{ "FelipeLema/cmp-async-path" }, -- path outo asynchronous
})

-- Plugin config

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

require("indent_blankline").setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = false,
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
})

-- Targets
vim.g.targets_aiAI = "aiAI"

-- Comment
require("Comment").setup({
	toggler = {
		---Line-comment toggle keymap
		line = "<leader>cc",
		---Block-comment toggle keymap
		block = "<leader>bc",
	},
	opleader = {
		---Line-comment keymap
		line = "<leader>c",
		---Block-comment keymap
		block = "<leader>b",
	},
	extra = {
		---Add comment on the line above
		above = "<leader>cO",
		---Add comment on the line below
		below = "<leader>co",
		---Add comment at the end of line
		eol = "<leader>cA",
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
	defaults = {
		mappings = {
			i = {
				["<cr>"] = "select_tab",
			},
			n = {
				["<cr>"] = "select_tab",
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

-- Gitsigns
require("gitsigns").setup({
	signs = {
		add = { text = "▎" },
		change = { text = "▎" },
		delete = { text = "➤" },
		topdelete = { text = "➤" },
		changedelete = { text = "▎" },
	},
})

-- Colorizer
require("colorizer").setup()

-- Glow
require("glow").setup({
	style = "dark",
	width = 120,
})

-- Illuminate
require("illuminate").configure({})

-- Modicator
require("modicator").setup({
	-- Show warning if any required option is missing
	show_warnings = true,
	highlights = {
		-- Default options for bold/italic
		defaults = {
			bold = false,
			italic = false,
		},
	},
})

-- Formatter
require("conform").setup({
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters_by_ft = {
		c = { "clang_format" },
		cpp = { "clang_format" },
		lua = { "stylua" },
		md = { "clang_format" },
		nix = { "alejandra" },
		python = { "isort", "black" },
		sh = { "shellcheck" },

		["*"] = { "codespell" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- Plugins end

----------------------------------------------------

-- StartUp

----------------------------------------------------

require("startup").setup({ theme = "startify" })

----------------------------------------------------

-- LSP servers with lazy-lsp

----------------------------------------------------

require("lazy-lsp").setup({
	excluded_servers = {
		"sqls",
	},
	preferred_servers = {
		haskell = { "hls" },
		rust = { "rust_analyzer" },
	},
	configs = {
		lua_ls = {
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
				},
			},
		},
	},
})

----------------------------------------------------

-- Autocompletion

----------------------------------------------------

-- Set up nvim-cmp.

local kind_icons = {
	Text = "",
	Method = "",
	Constructor = "",
}

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
	},
	formatting = {
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
			-- Source
			vim_item.menu = ({
				buffer = "[Buffer]",
				vsnip = "[Vsnip]",
				nvim_lsp = "[LSP]",
				async_path = "[Path]",
				dictionary = "[Dict]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "buffer" },
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "async_path" },
		{
			name = "dictionary",
			keyword_length = 5,
		},
	},
})

-- Lsp
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig").clangd.setup({
	capabilities = capabilities,
})

-- Dictionary setup
-- to change dict just run
-- :set spelllang=en
local dict = require("cmp_dictionary")

dict.setup({
	-- The following are default values.
	exact = 2,
	first_case_insensitive = false,
	document = false,
	document_command = "wn %s -over",
	async = false,
	sqlite = false,
	max_items = -1,
	capacity = 5,
	debug = false,
})

dict.switcher({
	spelllang = {
		en = "~/.config/nvim/dicts/en.dict",
	},
})
