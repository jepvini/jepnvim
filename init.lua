-- My nvim config in lua
-- By  Jep
--
-- still wip as always
--
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

-- Tabs are spaces
vim.opt.expandtab = true

-- Disable autocomment prssing on new line
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

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
vim.opt.guicursor = "n-v-i-r-c:block"

-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.pumheight = 5

----------------------------------------------------

-- Keybindings

----------------------------------------------------

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- jk as esc
vim.keymap.set({ "i" }, "jk", "<esc>")

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

-- Replace without touching the buffer
vim.keymap.set("x", "<leader>p", '"_dP')

-- Quote word
vim.keymap.set("n", "<leader>s", 'bi"<esc>ea"<esc>')
vim.keymap.set("n", "<leader>S", 'Bi"<esc>Ea"<esc>')

-- Sort selected text
vim.keymap.set("v", "<leader>S", ":sort<cr>")

-- Select whole buffe
vim.keymap.set("n", "<leader>A", ":keepjumps normal! ggVG<cr>")

-- Tabs
vim.keymap.set("n", "<leader>h", "<cmd>tabn 3<cr>") -- tab 3
vim.keymap.set("n", "<leader>j", "<cmd>tabn 1<cr>") -- tab 1
vim.keymap.set("n", "<leader>k", "<cmd>tabn 2<cr>") -- tab 2
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
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin space

require("lazy").setup({
  -- Themes
  { "Mofiqul/dracula.nvim", priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  { "folke/tokyonight.nvim", priority = 1000 },
  { "rebelot/kanagawa.nvim", priority = 1000 },
  {
    "rktjmp/lush.nvim",
    -- if you wish to use your own colorscheme:
    -- { dir = '/absolute/path/to/colorscheme', lazy = true },
  },

  -- No config
  { "tpope/vim-fugitive" }, -- git command from vim

  -- MarkdownPreview

  -- Various
  { "HiPhish/rainbow-delimiters.nvim" },
  { "LnL7/vim-nix" }, -- better support for nix
  { "RRethy/vim-illuminate" }, -- illuminate same word as cursor
  { "ThePrimeagen/vim-be-good" }, -- game
  { "akinsho/toggleterm.nvim" }, -- terminal
  { "editorconfig/editorconfig-vim" },
  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" }, -- md previwer
  { "folke/trouble.nvim" }, -- debug
  { "kyazdani42/nvim-tree.lua" }, -- file manager
  { "lervag/vimtex" }, -- latex
  { "mbbill/undotree" }, -- better undo
  { "norcalli/nvim-colorizer.lua" }, -- color over #999999
  { "numToStr/Comment.nvim" }, -- comment with leader cc
  { "nvim-lualine/lualine.nvim" }, -- status line theme
  { "nvim-telescope/telescope.nvim", tag = "0.1.2", dependencies = { "nvim-lua/plenary.nvim" } }, -- used by other plugins
  { "nvim-tree/nvim-web-devicons" }, -- icons
  { "nvim-treesitter/nvim-treesitter" }, -- fuzzy search
  { "pocco81/auto-save.nvim" }, -- auto save
  { "stevearc/conform.nvim" }, -- formatter
  { "stevearc/oil.nvim" }, -- file manager
  { "tpope/vim-repeat" }, -- better .
  { "tpope/vim-surround" }, -- adds the command surround
  { "wellle/targets.vim" }, -- surround
  { "windwp/nvim-autopairs" },
  { "zhimsel/vim-stay" }, -- cursor stays in place on file closing and reopening

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Additional lua configuration, makes nvim stuff amazing!
      "folke/neodev.nvim",
    },
  },

  {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Icon and text
      "onsails/lspkind.nvim",

      -- Snippet Engine & its associated nvim-cmp source
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      -- Adds LSP completion capabilities
      "hrsh7th/cmp-nvim-lsp",

      -- Adds a number of user-friendly snippets
      "rafamadriz/friendly-snippets",

      -- Adds path search
      "FelipeLema/cmp-async-path",

      -- Adds dictionary support
      "uga-rosa/cmp-dictionary",

      -- Buffer complete
      "hrsh7th/cmp-buffer",

      -- Buffer lines
      "amarakon/nvim-cmp-buffer-lines",

      -- Math calc
      "hrsh7th/cmp-calc",
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
-- vim.cmd.colorscheme("tokyonight")

-- Gruvbox
-- vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])

-- Kanagawa
require("kanagawa").setup({
  background = { -- map the value of 'background' option to a theme
    dark = "dragon", -- try "dragon" !
    light = "lotus",
  },
})

-- Dracula
-- Lua:
-- vim.cmd.colorscheme("dracula")

-- custom theme

vim.cmd.colorscheme("kanagawa")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#e6c384" })

-- Lualine

local lua_line_theme = require("lualine.themes.gruvbox")

-- Change the background of lualine_c section for normal mode
local colors = {
  black = "#16161d",
  white = "#dcd7ba",
  red = "#e82424",
  green = "#98bb6c",
  blue = "#7e9cd8",
  yellow = "#e6c384",
  purple = "#af5fd7",
  orange = "#ffa066",
  gray = "#727169",
}

lua_line_theme = {
  normal = {
    a = { bg = colors.purple, fg = colors.black, gui = "bold" },
    b = { bg = colors.black, fg = colors.purple },
    c = { bg = colors.black, fg = colors.purple },
  },
  insert = {
    a = { bg = colors.blue, fg = colors.black, gui = "bold" },
    b = { bg = colors.black, fg = colors.blue },
    c = { bg = colors.black, fg = colors.blue },
  },
  visual = {
    a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
    b = { bg = colors.black, fg = colors.yellow },
    c = { bg = colors.black, fg = colors.yellow },
  },
  replace = {
    a = { bg = colors.orange, fg = colors.black, gui = "bold" },
    b = { bg = colors.black, fg = colors.orange },
    c = { bg = colors.black, fg = colors.orange },
  },
  command = {
    a = { bg = colors.green, fg = colors.black, gui = "bold" },
    b = { bg = colors.black, fg = colors.green },
    c = { bg = colors.black, fg = colors.green },
  },
  inactive = {
    a = { bg = colors.gray, fg = colors.purple, gui = "bold" },
    b = { bg = colors.black, fg = colors.purple },
    c = { bg = colors.black, fg = colors.purple },
  },
}

vim.opt.showmode = false

require("lualine").setup({
  options = {
    theme = lua_line_theme,
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

-- Treesitter
require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
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
    "toml",
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
  update_focused_file = {
    enable = true,
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
      find_command = {
        "rg",
        "/",
        "--files",
        "--glob",
        "!.*",
        "--glob",
        "!boot/",
        "--glob",
        "!dev/",
        "--glob",
        "!nix/",
        "--glob",
        "!proc/",
        "--glob",
        "!root/",
        "--glob",
        "!run/",
        "--glob",
        "!srv/",
        "--glob",
        "!sys/",
        "--glob",
        "!tmp/",
        "--glob",
        "!usr/",
        "--glob",
        "!var/",
        "--glob",
        "!Git",
      },
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

vim.keymap.set("n", "<leader>R", "<cmd>Telescope registers<cr>")
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
vim.keymap.set("n", "<leader>r", "<cmd>Telescope oldfiles<cr>")

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

-- Conform
require("conform").setup({
  vim.api.nvim_create_user_command("Conform", function(args)
    local range = nil
    if args.count ~= -1 then
      local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
      range = {
        start = { args.line1, 0 },
        ["end"] = { args.line2, end_line:len() },
      }
    end
    require("conform").format({ async = true, lsp_fallback = false, range = range })
  end, { range = true }),

  formatters = {
    beautysh = {
      command = "beautysh",
      prepend_args = { "--indent-size", "2" },
    },
    clang_format = {
      command = "clang-format",
      prepend_args = { "--style", "file:/home/leo/.config/nvim/clang/clang-format" },
    },
    stylua = {
      command = "stylua",
      prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
    },
  },

  formatters_by_ft = {
    c = { "clang_format" },
    cpp = { "clang_format" },
    json = { "jq" },
    lua = { "stylua" },
    md = { "mdformat" },
    nix = { "alejandra" },
    python = { "isort", "black" },
    sh = { "beautysh" },
    toml = { "taplo" },

    ["*"] = { "codespell", "trim_whitespace", "trim_newlines" },
  },
})

vim.keymap.set("n", "<leader>g", vim.cmd.Conform)

-- Undotree
vim.keymap.set("n", "<leader>p", vim.cmd.UndotreeToggle)

-- Trouble
vim.keymap.set("n", "<leader>xx", function()
  require("trouble").toggle()
end)

-- Glow
require("glow").setup({})

-- Nvim autopairs
require("nvim-autopairs").setup({})

-- RainbowDelimiter

-- This module contains a number of default definitions
local rainbow_delimiters = require("rainbow-delimiters")

-- @type rainbow_delimiters.config
vim.g.rainbow_delimiters = {
  strategy = {
    [""] = rainbow_delimiters.strategy["global"],
    vim = rainbow_delimiters.strategy["local"],
  },
  query = {
    [""] = "rainbow-delimiters",
    lua = "rainbow-blocks",
  },
  priority = {
    [""] = 110,
    lua = 210,
  },
  highlight = {
    "RainbowDelimiterRed",
    "RainbowDelimiterYellow",
    "RainbowDelimiterBlue",
    "RainbowDelimiterOrange",
    "RainbowDelimiterGreen",
    "RainbowDelimiterViolet",
    "RainbowDelimiterCyan",
  },
}

-- Plugins end

----------------------------------------------------

-- LSP servers

----------------------------------------------------

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  nmap("<leader>nn", vim.lsp.buf.rename, "re[n]ame")
  nmap("<leader>oa", vim.lsp.buf.code_action, "c[O]de [A]ction")

  nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]definition")
  nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]references")
  nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
  nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]definition")
  nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]symbols")
  nmap("<leader>Ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]symbols")

  -- See `:help K` for why this keymap
  nmap("<leader>i", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

  -- Lesser used LSP functionality
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
  nmap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "[W]orkspace [L]ist Folders")

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    vim.lsp.buf.format()
  end, { desc = "Format current buffer with LSP" })
end

-- Setup neovim lua configuration
require("neodev").setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Lspconfig
local lspconfig = require("lspconfig")

lspconfig.bashls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig.clangd.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
    },
  },
})
lspconfig.marksman.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig.matlab_ls.setup({
  filetypes = { "matlab" },
  single_file_support = true,
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig.nil_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig.pyright.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig.yamlls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup({})
require("cmp_dictionary").setup({
  paths = { "/home/leo/.config/nvim/dicts/en.dict" },
  exact_length = 2,
  first_case_insensitive = true,
})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),

  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 3 },
    { name = "async_path" },
    -- { name = "buffer-lines" },
    { name = "calc" },
    {
      name = "dictionary",
      keyword_length = 4,
    },
  },

  formatting = {
    fields = { "abbr", "menu", "kind" },
    expandable_indicator = false,
    format = lspkind.cmp_format({
      mode = "symbol_text",
      menu = {
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        buffer = "[Buffer]",
        async_path = "[Path]",
        calc = "[Calc]",
        dictionary = "[Dict]",
      },
    }),
  },

  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
    },
  },
})
