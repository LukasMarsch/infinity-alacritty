Set-Alias vim nvim
Set-Alias dn dotnet
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
    if($sTerm) { $sTerm = "/search?q=" + $sTerm}
    else { $sTerm = $null }
    Start-Process microsoft-edge:"https://www.google.com$sTerm"
}

function ll {
    Get-ChildItem -Directory -Force
}

function l { ll }

function la { ls -Force }

function repo {
    param ( [Parameter(Mandatory, Position=0)][Int] $in )

    if($in -eq "1") { cd -Path "C:\Users\lmarsch\Repositories" }
    elseif($in -eq "2") { cd -Path "C:\Users\lmarsch\OneDrive - Vater Unternehmensgruppe\Ausbildung\Repositories" }
}

function edge ([String][Parameter(Position=0)] $path) {
    Start-Process microsoft-edge:$path
}
