$fichier = ".\readme.txt"
"Bonjour !!`nVoici un premier script" | Set-Content -Path $fichier
Get-Content -Path $fichier | Write-Host 
