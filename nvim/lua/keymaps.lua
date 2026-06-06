-- =============================================================================
-- CENTRALIZED MASTER KEYMAP ARCHITECTURE (Neovim 0.12+ Core Alignment)
-- =============================================================================

local map = vim.keymap.set -- Cache core keymap function pointer for execution efficiency
local fzf = require("fzf-lua") -- Cache your primary mouse-less search engine orchestration

-- --- [[ Basic Operational Mappings ]] ---
map("n", "<leader>w", ":w<CR>", { desc = "Save file" }) -- Flush active buffer frames straight to storage disk
map("n", "<leader>q", ":q<CR>", { desc = "Quit Neovim" }) -- Safe shutdown request pipeline
map("n", "<leader>Q", ":q!<CR>", { desc = "Force Quit Neovim (discard changes)" }) -- Emergency drop ignoring modifications
map("n", "<leader>x", ":wq<CR>", { desc = "Save and Quit" }) -- Atomically serialize data changes and exit
map("n", "<leader>pl", "o<C-r>+<Esc>", { desc = "Paste system clipboard to new line below" }) -- Clean system memory insertion macro

-- --- [[ Line Transposition Engine ]] ---
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" }) -- Shift line down and recalibrate indentation
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" }) -- Shift line up and recalibrate indentation
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" }) -- Shift visual selection down safely
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" }) -- Shift visual selection up safely

-- --- [[ Visual Block Indentation Controls ]] ---
map("v", "<", "<gv", { desc = "Indent left and reselect" }) -- Shift blocks left and lock focus for consecutive shifts
map("v", ">", ">gv", { desc = "Indent right and reselect" }) -- Shift blocks right and lock focus for consecutive shifts

-- =============================================================================
-- [[ CORE INTEGRATED PLUGIN MAP MATRIX ]]
-- =============================================================================

-- --- Plugin: neo-tree.nvim ---
map("n", "<leader>e", ":Neotree filesystem toggle left<CR>", { desc = "Toggle Neo-tree" })

-- --- Plugin: vim-tmux-navigator ---
map({ "n", "t" }, "<C-h>", function()
	vim.cmd("TmuxNavigateLeft")
end, { desc = "Move to left pane" })
map({ "n", "t" }, "<C-j>", function()
	vim.cmd("TmuxNavigateDown")
end, { desc = "Move to down pane" })
map({ "n", "t" }, "<C-k>", function()
	vim.cmd("TmuxNavigateUp")
end, { desc = "Move to up pane" })
map({ "n", "t" }, "<C-l>", function()
	vim.cmd("TmuxNavigateRight")
end, { desc = "Move to right pane" })

-- --- Plugin: diffview.nvim ---
map("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Diffview: Open Git Diff" })
map("n", "<leader>gh", ":DiffviewFile<CR>", { desc = "Diffview: Open Current File Diff" })
map("n", "<leader>gl", ":DiffviewLog<CR>", { desc = "Diffview: Open Git Log Diff" })
map("n", "<leader>gq", ":DiffviewClose<CR>", { desc = "Diffview: Close Diffview" })

-- --- Plugin: gemini.nvim ---
map("n", "<leader>gg", "<cmd>GeminiChat<CR>", { desc = "Gemini: Open chat" })
map("v", "<leader>ge", ":<C-u>GeminiCodeExplain<CR>", { desc = "Gemini: Explain code" })
map("v", "<leader>gr", ":<C-u>GeminiCodeReview<CR>", { desc = "Gemini: Code review" })
map("v", "<leader>gt", ":<C-u>GeminiUnitTest<CR>", { desc = "Gemini: Generate unit tests" })

-- --- [NEW UPDATED SECTION] Plugin: Native Core Commenter Controls ---
-- We leverage Neovim's 0.12 native engine using 'remap = true' to fire built-in routines
map("n", "<leader>cc", "gcc", { remap = true, desc = "Comment: Toggle Active Line" })
map("v", "<leader>c", "gc", { remap = true, desc = "Comment: Toggle Selected Block" })

-- --- Plugin: fzf-lua ---
map("n", "<leader>ff", fzf.files, { desc = "FZF: Find Files" })
map("n", "<leader>fb", fzf.buffers, { desc = "FZF: Find Buffers" })
map("n", "<leader>fg", fzf.live_grep, { desc = "FZF: Live Grep (text)" })
map("n", "<leader>fh", fzf.help_tags, { desc = "FZF: Search Help" })
map("n", "<leader>fG", fzf.git_files, { desc = "FZF: Git Files" })
map("n", "<leader>fc", fzf.git_commits, { desc = "FZF: Git Commits" })
map("n", "<leader>ts", fzf.lsp_document_symbols, { desc = "FZF: LSP Document Symbols" })
map("n", "<leader>fl", function()
	fzf.grep({ search = "ERROR|WARN" })
end, { desc = "FZF: Quick Log Triage" })
map("n", "<leader>fz", fzf.blines, { desc = "FZF: Search in current file" })

-- --- Plugin: vim-mundo ---
map("n", "<leader>u", "<cmd>MundoShow<CR>", { desc = "Open Undo Tree (Mundo)" })

-- --- Plugin: copilot.vim ---
map("i", "<C-l>", function()
	vim.fn.feedkeys(vim.fn["copilot#Accept"](), "i")
end, { noremap = true, silent = true, desc = "Copilot: Accept suggestion" })

-- --- Plugin: conform.nvim ---
map({ "n", "v" }, "<leader>cf", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format File" })

-- --- Plugin: nvim-dap ---
map("n", "<F5>", function()
	require("dap").continue()
end, { desc = "Dap: Continue" })
map("n", "<F10>", function()
	require("dap").step_over()
end, { desc = "Dap: Step Over" })
map("n", "<F11>", function()
	require("dap").step_into()
end, { desc = "Dap: Step Into" })
map("n", "<F12>", function()
	require("dap").step_out()
end, { desc = "Dap: Step Out" })
map("n", "<leader>b", function()
	require("dap").toggle_breakpoint()
end, { desc = "Dap: Toggle Breakpoint" })
map("n", "<leader>B", function()
	require("dap").set_breakpoint()
end, { desc = "Dap: Set Breakpoint" })
map("n", "<leader>dr", function()
	require("dap").repl.open()
end, { desc = "Dap: Open REPL" })
map("n", "<leader>dl", function()
	require("dap").run_last()
end, { desc = "Dap: Run Last" })
map({ "n", "v" }, "<leader>dh", function()
	require("dap.ui.widgets").hover()
end, { desc = "Dap: Hover Variables" })
map("n", "<leader>dp", function()
	require("dap.ui.widgets").preview()
end, { desc = "Dap: Preview Variables" })
map("n", "<leader>df", function()
	require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames)
end, { desc = "Dap: Show Frames" })
map("n", "<leader>ds", function()
	require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes)
end, { desc = "Dap: Show Scopes" })

-- =============================================================================
-- [[ CORE NATIVE LSP BUFFER-ATTACH KEYMAP LAYER ]]
-- =============================================================================
return function(client, bufnr)
	local lsp_map = function(mode, lhs, rhs, opts)
		opts = opts or {}
		opts.buffer = bufnr
		map(mode, lhs, rhs, opts)
	end

	vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
	lsp_map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
	lsp_map("n", "K", vim.lsp.buf.hover, { desc = "Hover Info" })
	lsp_map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
	lsp_map("n", "gr", vim.lsp.buf.references, { desc = "Show References" })
	lsp_map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
	lsp_map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

	-- Diagnostic Coordinates Navigation
	lsp_map("n", "[d", function()
		vim.diagnostic.jump({ count = -1 })
	end, { desc = "Previous Diagnostic" })
	lsp_map("n", "]d", function()
		vim.diagnostic.jump({ count = 1 })
	end, { desc = "Next Diagnostic" })

	local diagnostic_severity = vim.diagnostic.severity
	lsp_map("n", "[e", function()
		vim.diagnostic.jump({ count = -1, severity = diagnostic_severity.ERROR })
	end, { desc = "Previous ERROR Diagnostic" })
	lsp_map("n", "]e", function()
		vim.diagnostic.jump({ count = 1, severity = diagnostic_severity.ERROR })
	end, { desc = "Next ERROR Diagnostic" })
	lsp_map("n", "[w", function()
		vim.diagnostic.jump({ count = -1, severity = diagnostic_severity.WARN })
	end, { desc = "Previous WARNING Diagnostic" })
	lsp_map("n", "]w", function()
		vim.diagnostic.jump({ count = 1, severity = diagnostic_severity.WARN })
	end, { desc = "Next WARNING Diagnostic" })

	-- Diagnostic Interface Pools List
	lsp_map("n", "<leader>le", function()
		vim.diagnostic.setloclist({ severity = diagnostic_severity.ERROR })
	end, { desc = "Quickfix List with ERRORs" })
	lsp_map("n", "<leader>lw", function()
		vim.diagnostic.setloclist({ severity = diagnostic_severity.WARN })
	end, { desc = "Quickfix List with WARNINGS " })
end
