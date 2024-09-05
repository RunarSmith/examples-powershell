ForEach ($i in 1..10) {
    $i
}

Get-Process | ForEach-Object {
    Write-Output ("Id: {0}" -f $_.id)
}

$i=0
while ($i -lt 10) {
    Write-Output $i
    $i+=1    
}

$i=0
do {
    Write-Output $i
    $i+=1    
} while ($i -lt 10)

$i=0
do {
    Write-Output $i
    $i+=1    
} until ( $i -eq 10)
