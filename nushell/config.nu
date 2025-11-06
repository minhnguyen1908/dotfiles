# === My Nushell Config ===

# --- 1. Load Standard Library ---
# MUST be at the top. This fixes "unknown command: mkdir/path"
use std *

# --- 2. Setup PATH Environment ---
# We moved this from env.nu. Now it works.
# This is what lets us find 'starship' and 'carapace'
$env.PATH = ($env.PATH | prepend "/opt/homebrew/bin" | prepend "/opt/homebrew/sbin")

# --- 3. Load Catppuccin COLORS ---
# This gives 'ls' its pretty colors.
source ($nu.config-path | path dirname | path join "themes" | path join "catppuccin_macchiato.nu")

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

# --- 6. Activate Starship Prompt (THE FIX) ---
# This line will finally work because $env.PATH is set
# and Starship will find your ~/.config/starship.toml
$env.PROMPT_COMMAND = { || starship prompt }
