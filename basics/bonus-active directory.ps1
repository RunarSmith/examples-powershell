$Result = Get-ADUser -Filter "*"
$Result | ForEach-Object {
    Write-Host $_.DistinguishedName
    $_ | Format-Table -AutoSize
}
