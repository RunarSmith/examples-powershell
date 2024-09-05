
Get-ChildItem Env: 
ls env: | Format-Table -AutoSize

$env:testv = "This is a test environment variable."
[Environment]::SetEnvironmentVariable("testv", "VVVV", "User")
[Environment]::GetEnvironmentVariable("testv","User")
Remove-Item Env:\testv
[Environment]::SetEnvironmentVariable("testv",$null,"User")

$PSVersionTable.PSVersion
Write-Host "Votre version de Powershell: "  $PSVersionTable.PSVersion.ToString()

Write-host "Ce script a été appelé ainsi: " $MyInvocation.MyCommand

Write-host "Ce script est dans le répertoire: "$PSScriptRoot

Write-host "PID du process en cours: " $PID
