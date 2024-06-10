vim.opt.foldmethod = "marker"

-- {{{ KEYBINDS

-- leader
vim.g.maplocalleader = " "
vim.g.mapleader = " "

local keymapOptions = { noremap = true, silent = true }

-- Ctrl-s to save and format the document with Prettier
vim.keymap.set("n", "<C-s>", ":Prettier<CR> :w<CR>", keymapOptions)

-- Format the document with Prettier without saving
vim.keymap.set("n", "<Leader>p", ":PrettierAsync<CR>", keymapOptions)

-- Ctrl-q to  quit
vim.keymap.set("n", "<C-q>", ":q<CR>", keymapOptions)

-- netrw
-- vim.keymap.set("n", "<C-e>", ":Lexplore<cr>", keymapOptions)
-- vim.keymap.set("n", "<Leader>e", ":Lexplore<cr>", keymapOptions)

-- neo-tree
vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", keymapOptions)


-- split window
vim.keymap.set("n", "<leader>sp", ":split<CR>", keymapOptions)
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", keymapOptions)

-- split window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", keymapOptions)
vim.keymap.set("n", "<C-j>", "<C-w>j", keymapOptions)
vim.keymap.set("n", "<C-k>", "<C-w>k", keymapOptions)
vim.keymap.set("n", "<C-l>", "<C-w>l", keymapOptions)

--move highlighted text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- cursor stays in place when joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- cursor stays in place while searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz", keymapOptions)
vim.keymap.set("n", "<C-u>", "<C-u>zz", keymapOptions)
vim.keymap.set("n", "G", "Gzz", keymapOptions)

-- remove highlights after search
vim.keymap.set("n", "<leader>nh", ":noh<CR>", keymapOptions)

-- fold / unfold wit <Tab>
vim.keymap.set("n", "<Tab>", "zo", keymapOptions)
vim.keymap.set("n", "<S-Tab>", "zc", keymapOptions)

-- telescope keymaps
vim.keymap.set("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>", keymapOptions)
vim.keymap.set("n", "<leader>lg", ":lua require('telescope.builtin').live_grep()<CR>", keymapOptions)

-- lsp keymaps
vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<CR>", keymapOptions)
vim.keymap.set("n", "M", ":lua vim.lsp.buf.definition()<CR>", keymapOptions)
vim.keymap.set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", keymapOptions)


-- }}}

-- {{{ SETTINGS 

-- Netrw
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 30
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_list_hide = [=[\([^/]\|^\.\.\?$\|\.\S\+\/\]]=]

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 2 
vim.opt.signcolumn = "yes"

-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- sync clipboard between OS and NeoVim
vim.opt.clipboard = "unnamedplus"

-- tabs to spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- indentation
vim.opt.autoindent = true

-- split windows
vim.opt.splitbelow = true
vim.opt.splitright = true

-- scroll margins
vim.opt.scrolloff = 5

-- pop up menu (such as completion) height in lines
vim.opt.pumheight = 10

-- highlight on search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- mouse mode
vim.opt.mouse = "a"

-- width
vim.opt.colorcolumn = "80"

-- pop up menu (such as completion) height in lines
vim.opt.pumheight = 10

-- undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo"

-- case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- no wrap
vim.o.wrap = false

vim.opt.termguicolors = true

-- set normal highlight group background to none
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none', ctermbg = 'none' })

-- set nonText highlight group background to none
vim.api.nvim_set_hl(0, 'NonText', { bg = 'none', ctermbg = 'none' })


-- }}}

-- {{{ PLUGINS

-- {{{ Lazy.nvim | A modern plugin manager for Neovim
-- 

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("lazy").setup({
  -- }}}

  -- {{{ nvim-treesitter 
  -- Treesitter configurations and abstraction layer for Neovim
  {
    "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { 
          "lua", 
          "css", 
          "scss",
          "html",
          "javascript",
          "typescript",
          "json",
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },
  -- }}}

  -- {{{ Autoclose.nvim
  -- A minimalist Neovim plugin that auto pairs & closes brackets
  {
    "m4xshen/autoclose.nvim",
    config = function()
      require("autoclose").setup()
    end,
  },
  -- }}}

  -- {{{ Mason.nvim
  -- Install and manage LSP servers, DAP servers, linters, and formatters
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  }, 
  -- }}}

  -- {{{ nvim-lspconfig
  -- A collection of LSP configs

  {
    "neovim/nvim-lspconfig",
    config = function()
      require'lspconfig'.tsserver.setup{
        init_options = {
          hostInfo = "neovim"
        },
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx"
        },
      }
    end
  },
  -- }}}

  -- {{{ mason-lspconfig.nvim
  -- Bridges mason.nvim with the lspconfig plugin
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "html",
          "cssls",
        },
        automatic_installation = true,
        handlers = nil,
      })
    end,
  },
  -- }}}

  -- {{{ telescope.nvim
  -- A highly extendable fuzzy finder over lists
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    -- or                              , branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup{
        defaults = {
          search_dirs = {},
          file_ignore_patterns = {
            "Library",
            "node_modules"
          },
        }
      }
    end,
  },
  -- }}}

  -- {{{ vim-prettier
  -- A vim plugin wrapper for Prettier

  {
    "prettier/vim-prettier",
    config = function()
    	vim.g["prettier#config#config_precedence"] = "prefer-file"

      vim.g["prettier#config#arrow_parens"] = "always"
      vim.g["prettier#config#bracket_spacing"] = "false"
      vim.g["prettier#config#bracket_same_line"] = "true"
      vim.g["prettier#config#end_of_line"] = "lf"
      vim.g["prettier#config#html_whitespace_sensitivity"] = "css"
      vim.g["prettier#config#jsx_bracket_same_line"] = "true"
      vim.g["prettier#config#jsx_single_quote"] = "false"
      vim.g["prettier#config#print_width"] = "80"
      vim.g["prettier#config#prose_wrap"] = "preserve"
      vim.g["prettier#config#semi"] = "true"
      vim.g["prettier#config#single_attribute_per_line"] = "false"
      vim.g["prettier#config#single_quote"] = "false"
      vim.g["prettier#config#tab_width"] = "2"
      vim.g["prettier#config#trailing_comma"] = "es5"
      vim.g["prettier#config#use_tabs"] = "false"
    end 
  },
  -- }}}
  
-- {{{ vim-cspell
-- Checks spelling by using cspell for Vim/Neovim

  {
    "ryu-ichiroh/vim-cspell",

    config = function()
        vim.g.cspell_ext = {
          ".txt", ".js", ".ts", ".jsx", ".tsx", ".html", ".css", "scss", ".md", ".json"
        }
        vim.g.cspell_config_file = vim.fn.expand('~/.cspell.json')

    end
  },
  -- }}}

-- {{{ neo-tree.nvim
-- Plugin to browse the file system and other tree like structures

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            window = {
                width = 40,
                mappings = {
                    ["z"] = "close_all_nodes",
                    ["Z"] = "expand_all_nodes",
                    ["s"] = "open_vsplit",
                    ["S"] = "open_split",
                    ["."] = "set_root",
                    ["H"] = "toggle_hidden",
                },
            },
            filesystem = {
                filtered_items = {
                    visible = false,
                    hide_dotfiles = true,
                    hide_gitignored = true,
                    hide_hidden = true,
                    hide_by_name = {
                        "undo",
                    },
                },
            },
        })
    end
  },
  -- }}}

  -- {{{ lualine.nvim
    -- A blazing fast and easy to configure Neovim statusline written in Lua

    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        require('lualine').setup {
          options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {
              statusline = {},
              winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
              statusline = 1000,
              tabline = 1000,
              winbar = 1000,
            }
          },
          sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
          },
          inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
          },
          tabline = {},
          winbar = {},
          inactive_winbar = {},
          extensions = {}
        }
      end
      }
  -- }}}

}, opts)

-- }}}
