
$DebugPreference
Write-Debug "Cannot open file."         # Rien n'est affiché
$DebugPreference = "Continue"
Write-Debug "Cannot open file."         # imprime le message
$DebugPreference = "SilentlyContinue"   # Valeur par defaut


function Test-Debug {
    [cmdletbinding()]
    Param()
    # Le bloc de paramètres vide est nécessaire afin de prendre en compte les common_parameters (-Debug, etc.)

    if ( $false -eq ( Test-Path -Path "gloubiboulga.nuage" ) ) {
        Write-Debug "Cannot open file from function."
    }
}

Test-Debug          # Aucune sortie de Debug
Test-Debug -Debug   # Active les traces de Debug


Write-Error "Error level"               # Sortie OK
Write-Warning "Warn level"              # Sortie OK
Write-Information "Infoamtion level"    # pas de Sortie
Write-Verbose "Verbose level"           # pas de sortie
Write-Verbose "Verbose level" -Verbose  # Sortie OK

$VerbosePreference = "Continue" 
Write-Verbose "Verbose level"           # Sortie OK
