$alacrittyConfig = "~\AppData\Roaming\alacritty"

Write-Host "Installing latest Powershell"
winget install Microsoft.Powershell

Write-Host "Installing latest Alacritty"
winget install Allacritty.Alacritty

if(Test-Path $alacrittyConfig\alacritty.yml) {
    mv "$alacrittyConfig\alacritty.yml" "$alacrittyConfig\alacritty.yml.old"
    cp ".\alacritty.toml" "$alacrittyConfig\alacritty.toml"
}

Write-Host "Downloading Powershell Profile, we will backup your old config if you have one"
if(Test-Path $profile) {
    mv $profile "$profile.old"
}

Start-Process alacritty
if($(ps alacritty) -gt 0)
    Stop-Process alacritty
    Write-Host "Please install a nerdfont of your choice or the recommended JetBrains Nerdfont from the selection"
    sleep -Seconds 4
    Start-Process microsoft-edge:"https://www.nerdfonts.com/font-downloads"
}
