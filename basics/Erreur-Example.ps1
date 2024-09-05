
# Stop-Process -Name "invalidprocess" –ErrorAction Stop

try {
    Write-Host = "Avant l'instruction fautive"
    Stop-Process -Name "invalidprocess" –ErrorAction Stop
    Write-Host = "Après l'instruction fautive"
}
catch [Microsoft.PowerShell.Commands.ProcessCommandException] {
    Write-Host "Exection [Microsoft.PowerShell.Commands.ProcessCommandException] interceptée !!!"
    Write-Host "Exception : $($_.Exception.GetType().Fullname)"
    Write-Host "ERREUR: Le processus n'a pas été trouvé !"
}
catch {
    Write-Host "Exection de type inconnu interceptée !... Cette erreur est non prévue par le programe"
    Write-Host "Exception : $($_.Exception.GetType().Fullname)"
}
finally {
    Write-Host = "Block finally exécuté, on vient ici dans tous les cas"
}
