log(){
    local -r level="$1"
    local -r message="$2"
    local -r timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    >&2 echo -e "${timestamp} [${level}] [$SCRIPT_NAME] ${message}"
}

die(){
    local msg=$1
    local code=${2-1} # default exit status 1
    log "FATAL" "$msg"
    exit "$code"
}

assert_in_nix(){
    [[ -n "${IN_NIX_SHELL:-}" ]] || die "Not running in a nix shell"
}
