# Definir el nombre del proceso, la entrada del registro y la ruta de la carpeta a eliminar
$nombreProceso = "SMSUCN"
$nombreEntrada = "MsUpdate"
$rutaRegistro = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
$carpeta = "C:\Users\candrade\AppData\Local\Microsoft\MsUpdate"

# Matar el proceso si está en ejecución
$proceso = Get-Process -Name $nombreProceso -ErrorAction SilentlyContinue
if ($proceso) {
    Stop-Process -Name $nombreProceso -Force
    Write-Host "Proceso '$nombreProceso' detenido."
} else {
    Write-Host "El proceso '$nombreProceso' no está en ejecución."
}

# Eliminar la entrada del registro
Remove-ItemProperty -Path $rutaRegistro -Name $nombreEntrada -ErrorAction SilentlyContinue
Write-Host "Entrada de registro '$nombreEntrada' eliminada si existía."

# Eliminar la carpeta y su contenido
if (Test-Path -Path $carpeta) {
    Remove-Item -Path $carpeta -Recurse -Force
    Write-Host "Carpeta '$carpeta' y su contenido han sido eliminados."
} else {
    Write-Host "La carpeta '$carpeta' no existe."
}
