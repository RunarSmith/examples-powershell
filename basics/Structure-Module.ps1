
$MonModule = Join-Path -Path $PSScriptRoot -ChildPath Structure-Module

Import-Module $MonModule -ErrorAction Stop

$resultat = Test-Parametres -Monparametre1 "Mon paramètre de test depuis le fichier ps1"

Write-Host "La fonction a retourné: "$resultat
