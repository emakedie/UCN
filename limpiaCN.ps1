# Detener el proceso Mscnsrv.exe si está en ejecución
$process = Get-Process -Name "Mscnsrv" -ErrorAction SilentlyContinue
if ($process) {
    Stop-Process -Name "Mscnsrv" -Force
}

# Eliminar la carpeta oculta C:\Users\candrade\AppData\Local\Microsoft\MsUpdate
$folderPath = "C:\Users\candrade\AppData\Local\Microsoft\MsUpdate"
if (Test-Path $folderPath) {
    Remove-Item -Path $folderPath -Recurse -Force
}

# Eliminar la tarea programada MscnSrvUpdate
$taskName = "MscnSrvUpdate"
Unregister-ScheduledTask -TaskName $taskName -Confirm:$false -ErrorAction SilentlyContinue

# Opcional: Confirmar que la tarea ha sido eliminada y la carpeta borrada
Write-Host "Proceso detenido, carpeta eliminada y tarea programada eliminada."
