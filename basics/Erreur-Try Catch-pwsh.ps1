
Write-Host "Avant l'erreur, sans try/catch"
Get-Content -Path "gloubiboulga.nuage"
Write-Host "Après l'erreur"

try {
    $testVariable = 'Voilà un test, dans le bloc try{}'
    Write-Host "Avant l'erreur"
    Get-Content -Path "gloubiboulga.nuage" -ErrorAction Stop
    Write-Host "Après l'erreur, dans le bloc try{}"
}
catch [System.Management.Automation.ItemNotFoundException] {
    Write-Host -BackgroundColor DarkRed -ForegroundColor Yellow "Exection [System.Management.Automation.ItemNotFoundException] interceptée !!!"
    Write-Host "Exception : $($_.Exception.GetType().Fullname)"
}
catch {
    Write-Host "Exection de type inconnu interceptée !... Cette erreur est non prévue par le programe"
    Write-Host "Exception : $($_.Exception.GetType().Fullname)"
}
finally {
    $testVariable = "Block finally exécuté, on vient ici dans tous les cas"
}

Write-Host $testVariable
