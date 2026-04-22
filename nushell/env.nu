# === My Nushell Environment ===

# This file is ONLY for simple variables.
# All logic MUST go in config.nu

$env.VISUAL = "nvim"
$env.EDITOR = "nvim"

$env.G2TRADE_SERVER = "my-user@g2trade-server.com"
$env.SERVERLOG_SERVER = "my-user@serverlog-server.com"

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'

# --- PATH CONFIGURATION ---
# We use 'prepend' so your custom tools take priority over system ones
$env.PATH = (
        $env.PATH
    | split row (char esep)
        | prepend '/Library/TeX/texbin'
        | prepend '/opt/homebrew/opt/libpq/bin'
        | prepend '/opt/homebrew/sbin'
        | prepend '/opt/homebrew/bin'
)

$env.CGO_CFLAGS = "-I/opt/homebrew/include"
$env.CGO_LDFLAGS = "-L/opt/homebrew/lib"
$env.PKG_CONFIG_PATH = "/opt/homebrew/lib/pkgconfig"

try {
    source ($nu.default-config-dir | path join 'secrets.nu')
} catch {
    print "Warning: secrets.nu not found"
}
