PowerShell.exe -ExecutionPolicy Bypass
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Install-Script -name Get-WindowsAutopilotInfo -Force
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned -Force
Get-WindowsAutoPilotInfo -Online
