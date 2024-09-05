# Lecture d'un fichier : CSV
$Data = Import-Csv -Path "donnees-fichier.csv" -Delimiter ";"
$Data[2].username

# autre lecture d'un fichier : CSV
(Get-Content -Path "donnees-fichier.csv" | ConvertFrom-Csv -Delimiter ";")[2].username

# ecriture d'un CSV:
Get-Process | Select-Object ID, Name, Description, Company | Export-CSV "process.csv" -NoTypeInformation -Delimiter ";"
# relecture :
$Processes = Import-CSV "process.csv" -Delimiter ";"
$Processes[0]

