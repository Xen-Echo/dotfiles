Function nvim {
    if ($args) {
        wsl nvim "$(wsl wslpath -ua $args.Replace("\", "\\"))"
    } else {
        wsl nvim
    }
}

Function ll {
    Get-ChildItem -Force $args
}
