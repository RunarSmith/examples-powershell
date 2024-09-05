mkdir test
$contenu = "Bonjour !!`nVoici un premier script"
$fichier = ".\readme.txt"
Set-Content -Path $fichier -Value $contenu
$resultat = Get-Content -Path $fichier
if ($null -ne $resultat ) {
    Write-Host $resultat
} 
