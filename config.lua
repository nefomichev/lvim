vim.opt.shiftwidth = 8
vim.opt.tabstop = 2
vim.opt.relativenumber = true
-- general
lvim.log.level = "info"
lvim.format_on_save = {
        enabled = true,
        pattern = "*.lua",
        timeout = 1000,
}

lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.builtin.which_key.mappings["h"] = { "<C-w>h", "Window jump left" }
lvim.builtin.which_key.mappings["l"] = { "<C-w>l", "Window jump right" }
lvim.builtin.which_key.mappings["j"] = { "<C-w>j", "Window jump down" }
lvim.builtin.which_key.mappings["k"] = { "<C-w>k", "Window jump up" }

lvim.keys.normal_mode["<C-Up>"] = ":resize -2<CR>"
lvim.keys.normal_mode["<C-Down>"] = ":resize +2<CR>"
lvim.keys.normal_mode["<C-Left>"] = ":vertical resize -2<CR>"
lvim.keys.normal_mode["<C-Right>"] = ":vertical resize +2<CR>"
lvim.keys.normal_mode["L"] = ":bNext<CR>"
lvim.keys.normal_mode["H"] = ":bprevious<CR>"
lvim.keys.insert_mode["jk"] = "<ESC>"

lvim.colorscheme = "lunar"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.treesitter.auto_install = true

lvim.plugins = {
        {
                "nvim-neo-tree/neo-tree.nvim",
                branch = "v2.x",
                dependencies = {
                        "nvim-lua/plenary.nvim",
                        "nvim-tree/nvim-web-devicons",
                        "MunifTanjim/nui.nvim",
                },
                config = function()
                        require("neo-tree").setup({
                                close_if_last_window = true,
                                enable_git_status = true,
                                window = {
                                        width = 30,
                                },
                                buffers = {
                                        follow_current_file = true,
                                },
                                filesystem = {
                                        follow_current_file = true,
                                        filtered_items = {
                                                hide_dotfiles = false,
                                                hide_gitignored = false,
                                                hide_by_name = {
                                                        "node_modules"
                                                },
                                                never_show = {
                                                        ".DS_Store",
                                                        "thumbs.db"
                                                },
                                        },
                                },
                        })
                end
        },

        {
                "mrjones2014/nvim-ts-rainbow",
        },

        {
                'akinsho/toggleterm.nvim', version = "*", config = true
        },

}

lvim.builtin.nvimtree.active = false -- NOTE: using neo-tree
lvim.builtin.which_key.mappings["e"] = { ":NeoTreeFocusToggle<CR>", "Explorer" }
lvim.builtin.which_key.mappings["w"] = { ":bdelete<CR>", "Close buffer" }
lvim.builtin.which_key.mappings["r"] = { ":Telescope live_grep<CR>", "Live grep" }

lvim.builtin.treesitter.rainbow.enable = true

function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<leader>h', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<leader>j', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<leader>k', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<leader>l', [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set('t', '<leader>w', [[<C-\><C-n><C-w>]], opts)
end

local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
        lazygit:toggle()
end

lvim.builtin.which_key.mappings["g"] = { "<cmd>lua _lazygit_toggle()<CR>", "Lazy git" }
lvim.builtin.which_key.mappings['t'] = { "<cmd>ToggleTerm<CR>", "Toggle Term" }

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
