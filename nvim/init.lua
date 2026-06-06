-- ==========================================================================
-- NEOVIM ARCHITECTURAL CORE INITIALIZATION (Modern 2026 Engine Alignment)
-- ==========================================================================

-- --- AI & Copilot Foundations ---
-- Disable default Tab maps for GitHub Copilot so we can assign custom triggers
vim.g.copilot_no_tab_map = true

-- Bind your explicit isolated Python virtualenv path for provider plugins
vim.g.python3_host_prog = vim.fn.expand("~/.pyenv/versions/neovim3/bin/python")

-- --- Keymap Leader Layer ---
-- Define your operational prefix keys. MUST be initialized before loading plugins!
vim.g.mapleader = " "
vim.g.maplocalleader = " " -- Safe fallback for local/buffer-specific bindings

-- ==========================================================================
-- [[ GLOBAL REGULAR OPTIONS MATRIX ]]
-- ==========================================================================

-- Line Numbering Controls
vim.o.number = true -- Display absolute coordinates for current line
vim.o.relativenumber = true -- Enable relative numbers to speed up rapid "j"/"k" vertical jumps

-- Graphical Window Rules
vim.o.termguicolors = true -- Assert true 24-bit RGB canvas colors matching Ghostty theme styles
vim.o.wrap = false -- Disable line wrapping to protect clean structure across long files
vim.o.cursorline = true -- Color-highlight the line where the cursor rests
vim.o.scrolloff = 10 -- Keep at least 10 lines visible above/below cursor when scrolling
vim.o.list = true -- Render invisible helper chars (tabs, trailing whitespaces)
vim.o.mouse = "a" -- Keep multi-mode mouse pointer active for rapid pane/window adjustments

-- Spacing & Tabulation Standards (4-Space DevOps Baseline)
vim.o.expandtab = true -- Automatically swap raw tab characters out for spaces
vim.o.tabstop = 4 -- Set visual width of a hard tab to 4 spaces
vim.o.shiftwidth = 4 -- Space count used when shifting blocks using commands like '>>' or '<<'
vim.o.autoindent = true -- Copy the precise indentation from the previous line on newlines
vim.o.smartindent = true -- Enable syntactic language-aware auto-indentation

-- Pattern Searching Mechanics
vim.o.hlsearch = true -- Color-highlight all matches discovered during search loops
vim.o.incsearch = true -- Incrementally jump to prospective search matches as you type
vim.o.ignorecase = true -- Disregard letter-casing inside query items
vim.o.smartcase = true -- Override ignorecase automatically if query includes uppercase characters

-- Session Persistence & Buffer Recovery
vim.o.confirm = true -- Request a popup modal instead of failing if files have unsaved modifications
vim.o.undofile = true -- Activate persistent multi-session undo trees across editor boots
vim.o.undodir = vim.fn.stdpath("data") .. "/undodir" -- Store persistent undo paths

-- Split Management Layouts
vim.opt.splitright = true -- Force new vertical splits to open to the right
vim.opt.splitbelow = true -- Force new horizontal splits to open directly below

-- ==========================================================================
-- [[ NATIVE AST-DRIVEN CODE FOLDING ]]
-- ==========================================================================
-- Leverage Neovim's integrated core Tree-sitter intelligence for code scopes
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Calculate boundaries via core AST
vim.opt.foldlevel = 99 -- Ensure all blocks start completely expanded by default
vim.opt.foldlevelstart = 99 -- Retain standard expanded focus on fresh files

-- ==========================================================================
-- [[ AUTOMATION HOOKS & EVENT ACTIONS ]]
-- ==========================================================================

-- Enforce Runtime Undo Trees Path Verification
local undodir = vim.o.undodir
if not vim.fn.isdirectory(undodir) then
	vim.fn.mkdir(undodir, "p")
end

-- Synchronized System Clipboard Handling
vim.api.nvim_create_autocmd("UIEnter", {
	desc = "Deferred system clipboard alignment to accelerate early startup",
	callback = function()
		vim.o.clipboard = "unnamedplus" -- Connect your standard yanks directly to global memory space
	end,
})

-- Automated File Explorer Hook
vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("NeoTreeAutoOpen", { clear = true }),
	desc = "Auto-launch Neo-tree workspace tree on empty initial window boots",
	callback = function()
		if #vim.api.nvim_list_bufs() == 1 and vim.bo.buftype == "" and vim.fn.argv(0) == nil then
			vim.cmd("Neotree")
		end
	end,
})

-- Visual Copy Confirmation Flash
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight text boundaries briefly upon performing a copy action",
	callback = function()
		vim.highlight.on_yank() -- Modern, consistent core highlight executor
	end,
})

-- ==========================================================================
-- [[ CUSTOM OPERATIONAL COMMANDS ]]
-- ==========================================================================

-- Git Triage Commands
vim.api.nvim_create_user_command("GitBlameLine", function()
	local line_number = vim.fn.line(".")
	local filename = vim.api.nvim_buf_get_name(0)
	print(vim.fn.system({ "git", "blame", "-L", line_number .. ",+1", filename }))
end, { desc = "Extract git blame tracking logs for the active target line" })

-- ==========================================================================
-- [[ DIAGNOSTIC METERING & LSP UI APPEARANCE ]]
-- ==========================================================================
local diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = "",
	Info = "",
}

vim.diagnostic.config({
	virtual_text = { prefix = "●", spacing = 4 },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
			[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
			[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
			[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
		focusable = false,
		style = "minimal",
	},
})

-- Modernized Floating Rounded Windows Interceptor
do
	local orig = vim.lsp.util.open_floating_preview
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or "rounded"
		return orig(contents, syntax, opts, ...)
	end
end

-- ==========================================================================
-- [[ PLUGIN DECLARATIONS & PACKAGE ADDITIONS ]]
-- ==========================================================================

-- Bootstrap/execute your centralized lazy package ecosystem specifications
require("config.lazy")

-- Inject bundled core runtime plugins directly into the runtime loop
vim.cmd("packadd! nohlsearch") -- Automated search match styling suspension when typing starts

-- ==========================================================================
-- [[ NATIVE CORE TREESITTER SYSTEM HIGH-LIGHT LOOP ]]
-- ==========================================================================
vim.api.nvim_create_autocmd("FileType", {
	desc = "Instantly trigger core native AST compiler parsers on valid documents",
	callback = function()
		-- Triggers Neovim's pre-compiled fast internal parser engine.
		-- Safely wraps fallback protocols without logging crash popups.
		pcall(vim.treesitter.start)
	end,
})
