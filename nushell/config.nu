# === My Nushell Config ===

# --- 1. Load Standard Library ---
# MUST be at the top. This fixes "unknown command: mkdir/path"
use std *

# --- 2. Setup PATH Environment ---
# We moved this from env.nu. Now it works.
$env.PATH = ($env.PATH | prepend "/opt/homebrew/bin" | prepend "/opt/homebrew/sbin")

# --- 3. Load Catppuccin COLORS ---
# This is NOT the prompt. This gives 'ls' its pretty colors.
source ($nu.config-path | path dirname | path join "themes" | path join "macchiato.nu")

# --- 4. Load Custom Toolboxes ---
# (We can add these back when you're ready)
# use scripts/g2trade-logs.nu *
# use scripts/server-logs.nu *
# use scripts/websocket.nu *

# --- 5. Setup Carapace Completions ---
# We moved these commands from env.nu.
const carapace_cache = ($nu.cache-dir | path join "carapace.nu")
mkdir ($nu.cache-dir)
carapace _carapace nushell | save --force $carapace_cache
source $carapace_cache

# --- 6. Setup Starship Prompt (THE FIX) ---
# First, tell Starship where to find your config file
# We'll point it to the starship.toml from your dotfiles
let starship_config_path = ($nu.config-path | path dirname | path join "../starship.toml")
$env.STARSHIP_CONFIG = $starship_config_path

# --- 7. Activate Starship Prompt ---
# This is the "on switch" that tells Nushell
# to use 'starship' to render the prompt.
$env.PROMPT_COMMAND = { || starship prompt }
