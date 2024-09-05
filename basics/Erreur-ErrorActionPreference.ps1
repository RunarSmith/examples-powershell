function Test-ErrorActionPreference {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [String]$Preference
    )
    Write-Host "--- Preference: $Preference ---"
    $ErrorActionPreference = $Preference
    Write-Host "Avant l'erreur"

    Get-Item -Path "gloubiboulga.nuage"

    Write-Host "Après l'erreur"
}

Test-ErrorActionPreference -Preference "Continue"
Test-ErrorActionPreference -Preference "SilentlyContinue"
Test-ErrorActionPreference -Preference "Stop"

Write-Host "Fin du test"
