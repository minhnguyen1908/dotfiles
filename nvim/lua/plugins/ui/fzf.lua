-- ==============================================================================
-- FILE: lua/plugins/fzf.lua (HIGH-VELOCITY IN-MEMORY PICKER ORCHESTRATION)
-- ==============================================================================
-- Drives the ibhagwan/fzf-lua engine utilizing async in-memory thread pipelines.
-- [NEW]: Injected targeted performance overrides for the 'blines' provider layer.
-- Line-by-line documented to guarantee absolute home-row execution transparency.

return { -- Return the plugin configuration table directly to the lazy package manager
	"ibhagwan/fzf-lua", -- Target the lightning-fast Lua-native fuzzy implementation package
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- Pull down visual symbol mappings as a hard load prerequisite
	opts = { -- Declare the core options parameters configuration table for the plugin
		winopts = { -- Define global interface container presentation layout metrics
			height = 0.85, -- Allocate precisely 85 percent of the screen height to the container
			width = 0.85, -- Allocate precisely 85 percent of the screen width to the container
			preview = { -- Configure real-time syntax validation file inspection split behavior
				layout = "vertical", -- Preserve your custom vertical stacking layout orientation parameters
				vertical = "up:60%", -- Preserve your custom layout split distribution allocating 60 percent to the top
				wrap = false, -- Keep line-wrapping disabled inside the display buffer to maximize readability
				delay = 100, -- Maintain a stable 100ms debounce buffer to let background threads settle safely
			}, -- Terminate the preview sub-configuration block safely
		}, -- Terminate the window options parameters table cleanly
		files = { -- Configure the workspace filesystem discovery engine properties
			cmd = "fd --type f --hidden --follow --exclude .git --exclude node_modules --exclude target --exclude .terraform",
			multiprocess = true, -- Run filesystem discovery asynchronously across separate worker threads
			git_icons = false, -- Disable heavy git status tree tracking queries to save IO disk cycles
			file_icons = true, -- Map baseline layout icons from devicons to keep code blocks scannable
		}, -- Terminate the files finder customization matrix safely
		live_grep = { -- Customize the specific real-time dynamic text grep command options
			cmd = "rg --vimgrep --hidden --binary-files=without-match --no-heading --line-number --color=always --smart-case --glob '!{.git,node_modules,target,.terraform,*.pack,*.png,*.jpg}/*'",
			multiprocess = true, -- Force process parsing to execute across independent background thread loops
		}, -- Terminate live grep configurations cleanly
		-- [NEW]: Dedicated provider optimization matrix targeting the buffer lines search pipeline
		blines = { -- Intercept the internal in-memory buffer lines matching engine properties
			prompt = "BufferLines> ", -- Establishes a clean visual prompt header for the localized filter setup
			show_unlisted = false, -- Excludes hidden layout scratch buffers to protect execution speeds
			previewer = "builtin", -- Forces the picker framework to utilize native internal rendering logic
			-- Injects an isolated operational override to maximize keystroke input speed
			async = true, -- Forces fuzzy string comparisons to run asynchronously off the main thread
			debug = false, -- Disables internal telemetry tracing loops to eliminate console logging overhead
		}, -- Terminate the blines customization table block safely
		previewer = { -- Configure the background preview syntax rendering engine parameters
			type = "builtin", -- Forces fzf-lua to render files using native in-memory Lua buffers
			builtin = { -- Configure the native in-memory code highlighter tracking layers
				syntax = true, -- Directs the picker to utilize internal Tree-sitter definitions for speed
				treesitter = { enable = true }, -- Enables immediate structural language syntax parsing
			}, -- Terminate the native builtin previewer configuration array safely
		}, -- Terminate the global previewer handler definitions safely
		git = { -- Establish version control subsystem tracking integrations
			diff_tool = "delta", -- Route git history comparisons directly through the delta side pager
		}, -- Terminate git integration mappings context cleanly
	}, -- Terminate the package options block context safely
} -- Terminate the package module return layout block blueprint safely
