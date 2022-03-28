Write-Verbose "Importing Onboarding Script"
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Script -name Get-WindowsAutopilotInfo -Force
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned -Force
Write-Verbose "Starting Onboarding Script. Sign in when prompted."
Set-Location $env:ProgramFiles\WindowsPowerShell\Scripts\
.\Get-WindowsAutoPilotInfo -Online
