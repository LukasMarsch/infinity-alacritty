$alacrittyConfig = "~\AppData\Roaming\alacritty"
$alacrittyInstaller = "~\Downloads\Alacritty-v0.12.2-installer.msi"

Write-Host "Installing latest Powershell version please acknowledge and don't ask questions"
winget install Microsoft.Powershell

Write-Host "Installing latest Pansies version please acknowledge and don't ask questions"
Install-Module Pansies -AllowClobber

Write-Host "Downloading alacritty config"
if (!Test-Path $alacrittyConfig) {
    mkdir $alacrittyConfig
}

Write-Host "Downloading Alacritty Profile, this will backup your old config"
if(Test-Path $alacrittyConfig\alacritty.yml) {
    mv "$alacrittyConfig\alacritty.yml" "$alacrittyConfig\alacritty.yml.old"
iwr -useb "https://raw.githubusercontent.com/LukasMarsch/infinity-alacritty/main/alacritty.yml" -Confirm | ni "$alacrittyConfig\alacritty.yml"

Write-Host "Downloading Powershell Profile, we will backup your old config if you have one"
if(Test-Path $profile) {
    mv $profile "$profile.old"
}
iwr -useb "https://raw.githubusercontent.com/LukasMarsch/infity-alacritty/main/profile.ps1" -Confirm | ni $profile

if(!Test-Path "C:\Program Files\Alacritty\Alacritty.exe") {
    Write-Host "Installing Alacritty"
    iwr -useb "https://github.com/alacritty/alacritty/releases/download/v0.12.2/Alacritty-v0.12.2-installer.msi" | ni $alacrittyInstaller
    Write-Host "Please Install Alacritty and follow the instructions in the installer"
    Start-Process $alacrittyInstaller
}
Write-Host "Done"
Start-Process alacritty
