

Write-Host "Avant l'erreur"
[System.IO.File]::ReadAllText( "gloubiboulga.nuage" )
Write-Host "Après l'erreur"

try {
    $testVariable = 'Voilà un test'
    Write-Host "Avant l'erreur"
    [System.IO.File]::ReadAllText( "gloubiboulga.nuage" )
    Write-Host "Après l'erreur"
}
catch [System.IO.IOException] {
    Write-Host "Exection [System.IO.Exception] interceptée"
    Write-Host "Exception : $($_.Exception.GetType().Fullname)"
}
catch {
    Write-Host "Exection de type inconnu interceptée"
    Write-Host "Exception : $($_.Exception.GetType().Fullname)"
}
finally {
    $testVariable = "Block finally exécuté"
}


Write-Host $testVariable
