use std *

use scripts/chech_g3sb_log.nu *

$env.PATH = ($env.PATH | prepend "/opt/homebrew/bin" | prepend "/opt/homebrew/sbin")
$env.PATH = ($env.PATH | prepend "/opt/homebrew/opt/libpq/bin")
const carapace_cache = ($nu.cache-dir | path join "carapace.nu")
mkdir ($nu.cache-dir)
carapace _carapace nushell | save --force $carapace_cache
source $carapace_cache

$env.config = {
    show_banner: false

    edit_mode: "vi"

    completions: {
        external: {
            enable: true
            max_results: 100
            completer: {|spans|
                carapace $spans.0 nushell ...$spans | from json
            }
        }
    }

    ls: {
            use_ls_colors: true
            clickable_links: false
        }
}

zoxide init nushell | save -f ($nu.default-config-dir | path join "zoxide.nu")
source ($nu.default-config-dir | path join "zoxide.nu")

atuin init nu | save -f ($nu.default-config-dir | path join "atuin.nu")
source ($nu.default-config-dir | path join "atuin.nu")
