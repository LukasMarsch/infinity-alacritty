#oh-my-posh init pwsh --config '~\AppData\Local\Programs\oh-my-posh\themes\kushal.omp.json' | Invoke-Expression

Set-Alias vim nvim
Write-Host $(Get-Date -Format 'dddd HH:mm:ss tt')

function prompt {
    $cw = Get-ColorWheel 
    $host.ui.RawUI.WindowTitle = "$pwd"
    $CmdPromptCurrentFolder = Split-Path -Path $pwd -Leaf
    #$CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent();
    $IsAdmin = (New-Object Security.Principal.WindowsPrincipal ([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

    $ColorChanger = switch ($IsAdmin) {
        $true { "Orange" }
        $false { "DarkBlue" }
    }
    if ($IsWindows) { $os = "  " }
    elseif ($IsLinux) { $os = "  "}
    elseif ($IsMac) { $os = "  " }

    Write-Host $os -ForegroundColor Black -BackgroundColor $ColorChanger -NoNewline

    If ($CmdPromptCurrentFolder -like "*:*") { Write-Host "AAAAAAAAAAA" -BackgroundColor Red }

    Write-Host "" -ForegroundColor $ColorChanger -BackgroundColor "#45475A" -NoNewline
    Write-Host " \$CmdPromptCurrentFolder "  -ForegroundColor White -BackgroundColor "#45475A" -NoNewline
    Write-Host "" -ForegroundColor "#45475A" -BackgroundColor "#1E222A" -NoNewline

    return " "
}

function time {
    $date = Get-Date -Format "HH:mm:ss"
    Write-Output $date
}

function elevate {
    Start-Process alacritty -Verb RunAs
}

function google ([String][Parameter(Position=0)] $sTerm) {
    if($sTerm) { $sTerm = "/search?q=" + $sTerm
    Start-Process microsoft-edge:"https://www.google.com$sTerm"
}
