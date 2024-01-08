$HFile = "C:\Windows\System32\drivers\etc\hosts"

Function utils {
    ~/Scripts/utils/utils.ps1 $args
}

Function ll {
    Get-ChildItem -Force $args
}

Function touch {
    New-Item $args -ItemType File
}

Invoke-Expression (&starship init powershell)
