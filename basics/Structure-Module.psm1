
function Test-Parametres {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [String]$MonParametre1
    )
    Write-Host "Parametre fournit à la fonction: ${MonParametre1}"

    # retourne de résultat de la fonction
    Write-Output "Valeur de retour depuis le Module"
}

# Publication des fonctions
Export-ModuleMember -Function Test-Parametres
