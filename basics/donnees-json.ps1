$geography = Get-Content "donnees-fichier.json" | ConvertFrom-Json
$geography.countries

$geography.countries.Count
