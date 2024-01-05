--[[
  File: plugins.lua
  Description: This file needed for loading plugin list into lazy.nvim and loading plugins
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/folke/lazy.nvim
]]
require("helpers/globals")

return {
	-- Startuptime{{{
	{
		"tweekmonster/startuptime.vim",
	},
	--}}}

	-- Mason {{{
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("plugins.mason")
		end,
	},
	-- }}}

	-- CMP {{{
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				delete_check_events = "TextChanged",
				dependencies = {
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},

				--      config=function ()
				--        require("luasnip/loaders/from_vscode").load({paths={"~/.local/share/nvim/lazy/friendly-snippets/snippets"}})
				--      end
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lua",
			"ray-x/cmp-treesitter",

			"neovim/nvim-lspconfig",
		},
		opts = function()
			require("plugins.cmp")
		end,
	},
	-- }}}

	-- Git Signs{{{
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.gitsigns")
		end,
	},
	-- }}}

	-- Trouble {{{
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins.trouble")
		end,
	},
	-- }}}

	---- TreeSitter config copy from lazyvim {{{
	--{
	--  "nvim-treesitter/nvim-treesitter",
	--  build = ":TSUpdate",
	--  event = { "BufReadPost", "BufNewFile" },
	--  dependencies = {
	--    {
	--      "nvim-treesitter/nvim-treesitter-textobjects",
	--      init = function ()
	--        require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
	--        load_textobjects = true
	--      end,
	--    }
	--  },
	--  opts = {
	--    highlight = {
	--      enable = true,
	--        additional_vim_regex_highlighting = false,
	--        use_languagetree=false,
	--        disable = function(_,bufnr)
	--          local buf_name = vim.api.nvim_buf_get_name(bufnr)
	--          local file_size=vim.api.nvim_call_function("getfsize",{buf_name})
	--          return file_size > 256*1024
	--        end,
	--    },
	--    indent = { enable = true },
	--    ensure_installed = {
	--      "bash",
	--      "c",
	--      "json",
	--      "lua",
	--      "luadoc",
	--      "luap",
	--      "markdown",
	--      "markdown_inline",
	--      "python",
	--      "query",
	--      "regex",
	--      "vim",
	--      "vimdoc",
	--      "yaml",
	--    },
	--    incremental_selection = {
	--      enable = false,
	--    },
	--  },
	--  config = function(_, opts)
	--    if type(opts.ensure_installed) == "table" then
	--      ---@type table<string, boolean>
	--      local added = {}
	--      opts.ensure_installed = vim.tbl_filter(function(lang)
	--        if added[lang] then
	--          return false
	--        end
	--        added[lang] = true
	--        return true
	--      end, opts.ensure_installed)
	--    end
	--    require("nvim-treesitter.configs").setup(opts)
	--
	--    if load_textobjects then
	--      -- PERF: no need to load the plugin, if we only need its queries for mini.ai
	--      if opts.textobjects then
	--        for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
	--          if opts.textobjects[mod] and opts.textobjects[mod].enable then
	--            local Loader = require("lazy.core.loader")
	--            Loader.disabled_rtp_plugins["nvim-treesitter-textobjects"] = nil
	--            local plugin = require("lazy.core.config").plugins["nvim-treesitter-textobjects"]
	--            require("lazy.core.loader").source_runtime(plugin.dir, "plugin")
	--            break
	--          end
	--        end
	--      end
	--    end
	--  end,
	--},

	-- }}}
	-- Nvim-various-textobjs {{{
	{
		"chrisgrieser/nvim-various-textobjs",
		opts = { useDefaultKeymaps = true },
	},
	-- }}}

	-- Theme: nvim-base16 {{{
	{
		"RRethy/nvim-base16",
		lazy = false,
		config = function()
			require("plugins.colorscheme.nvim-base16")
		end,
	},
	-- }}}

	---- Hardtime{{{
	----  {
	----  "m4xshen/hardtime.nvim",
	----  opts = {}
	----  },
	---- }}}

	-- toggleterm{{{
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
		opts = function()
			require("plugins.toggleterm")
		end,
	},
	-- }}}

	-- Register {{{
	{
		"tversteeg/registers.nvim",
		name = "registers",
		keys = {
			{ '"', mode = { "n", "v" } },
			{ "<C_R>", mode = { "i" } },
		},
		cmd = "Registers",
		config = function()
			require("plugins.register")
		end,
	},
	-- }}}

	-- oil {{{

	{
		"stevearc/oil.nvim",
		opts = function()
			require("plugins.oil")
		end,
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- }}}

	-- Neoformat {{{
	{
		"sbdchd/neoformat",
	},
	-- }}}

	-- Tmux {{{
	-- set keybinding in tmux and nvim
	{
		"aserowy/tmux.nvim",
		configs = function()
			require("plugins.tmux")
		end,
	},

	--}}}

	---- Guess-indent {{{
	--{
	--  "nmac427/guess-indent.nvim" ,
	--  opts=function ()
	--    require "plugins.guess-indent"
	--  end
	--},
	--
	----}}}

	-- Flash {{{
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
		config = function()
			require("plugins.flash_config")
		end,
	},
	--}}}

	-- Centerpad {{{
	{
		"smithbm2316/centerpad.nvim",
	},

	--}}}

	-- surround {{{
	{
		"tpope/vim-surround",
	},
	--}}}

	{
		"willothy/flatten.nvim",
		config = true,
		-- or pass configuration with
		-- opts = {  }
		-- Ensure that it runs first to minimize delay when opening file from terminal
		lazy = false,
		priority = 1001,
	},

	{
		"vidocqh/auto-indent.nvim",
		config = function()
			require("plugins.auto-indent")
		end,
	},

	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("plugins.conform")
		end,
	},

	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({})
		end,
	},

	--{
	--  "ms-jpq/coq_nvim",
	--  -- optional for icon support
	--  dependencies = { "ms-jpq/coq.artifacts","ms-jpq/coq.thirdparty" },
	--  config = function()
	--    require "plugins.coq"
	--  end
	--},
	--

	{
		"t-troebst/perfanno.nvim",
		-- optional for icon support
		config = function()
			-- calling `setup` is optional for customization
			require("perfanno").setup({})
		end,
	},

	{
		"LunarVim/bigfile.nvim",
		-- optional for icon support
		config = function()
			-- calling `setup` is optional for customization
			require("bigfile").setup({})
		end,
	},

	{
		"LeonHeidelbach/trailblazer.nvim",
		config = function()
			require("trailblazer").setup({
				-- your custom config goes here
			})
		end,
	},
}
