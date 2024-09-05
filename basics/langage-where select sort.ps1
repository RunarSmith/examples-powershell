
# liste les services dans l'état 'Running'
Get-Service | Where-Object { $_.Status -eq "Running" }

# liste les services en n'affichant que la propriété 'DisplayName'
Get-Service | Select-Object DisplayName | ft

# liste les services dans l'état 'Running', et en n'affichant que la propriété 'DisplayName'
Get-Service | Where-Object { $_.Status -eq "Running" } | Select-Object DisplayName | ft

# tri de la liste sur la propriété 'Name' (sort)
Get-Service | Where-Object { $_.Status -eq "Running" } | Sort-Object -Property Name 

$intVariable = [Int]12
$intVariable.GetType()
$intVariable | Get-Member | Where-Object { $_.MemberType -eq "Method" } | ft
