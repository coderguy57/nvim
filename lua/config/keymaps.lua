-- lua/config/keymaps.lua
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- leader shortcuts
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find file" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",  { desc = "Grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>",    { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>",  { desc = "Help" })

-- trouble diagnostics list
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", opts)

-- save / quit comfort
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Write file" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- move lines up/down (visual mode)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- keep cursor centered when jumping
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- CMake commands
map("n", "<leader>cg", "<cmd>CMakeGenerate<cr>",           { desc = "CMake: generate" })
map("n", "<leader>cb", "<cmd>CMakeBuild<cr>",              { desc = "CMake: build" })
map("n", "<leader>cr", "<cmd>CMakeRun<cr>",                { desc = "CMake: run (selected target)" })
map("n", "<leader>ct", "<cmd>CMakeSelectBuildTarget<cr>",  { desc = "CMake: select target" })
map("n", "<leader>cd", "<cmd>CMakeDebug<cr>",              { desc = "CMake: debug target" })
map("n", "<leader>cc", "<cmd>CMakeClose<cr>",              { desc = "CMake: close terms" })
map("n", "<leader>cT", "<cmd>CMakeRunTest<cr>",            { desc = "CMake: ctest" })

-- DAP keys
map("n", "<F5>",  function() require("dap").continue() end,        { desc = "DAP Continue/Start" })
map("n", "<F10>", function() require("dap").step_over() end,        { desc = "DAP Step Over" })
map("n", "<F11>", function() require("dap").step_into() end,        { desc = "DAP Step Into" })
map("n", "<F12>", function() require("dap").step_out() end,         { desc = "DAP Step Out" })
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "DAP Breakpoint" })
map("n", "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "DAP Cond Breakpoint" })
map("n", "<leader>dr", function() require("dap").repl.open() end,   { desc = "DAP REPL" })
map("n", "<leader>du", function() require("dapui").toggle() end,    { desc = "DAP UI toggle" })

-- LeetCode commands
map("n", "<leader>lq", "<cmd>Leet<cr>", { desc = "LeetCode: open menu" })
map("n", "<leader>ll", "<cmd>Leet list<cr>", { desc = "LeetCode: list problems" })
map("n", "<leader>lt", "<cmd>Leet test<cr>", { desc = "LeetCode: test solution" })
map("n", "<leader>ls", "<cmd>Leet submit<cr>", { desc = "LeetCode: submit solution" })
map("n", "<leader>lr", "<cmd>Leet run<cr>", { desc = "LeetCode: run solution" })
map("n", "<leader>ld", "<cmd>Leet desc<cr>", { desc = "LeetCode: show description" })
map("n", "<leader>lc", "<cmd>Leet console<cr>", { desc = "LeetCode: console" })

