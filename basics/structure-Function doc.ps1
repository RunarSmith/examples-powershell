function Test-Parametres {
<#
.SYNOPSIS
    Fonction de test pour les paramètres
.DESCRIPTION
    Longue description qui explique en détail le rôle de la fonction. Ici notre fonction ne fait que prendre un paramètre et l'affiche dans la console.
    Notre fonction retourne une valeur fixe, qui est une chaine de caractères.
.EXAMPLE
    Test-Parametres -MonParametre1 "Ma chaine en paramètre"
.INPUTS
    MonParametre1   chaine de caractère en entrée, et qui sera affichée dans la console
.OUTPUTS
    Une chaine de caractère fixe.
.NOTES
    Il s'agit vraiment d'une fonction très simple pour démontrer les paramètres
#>
[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [String]$MonParametre1
)
    Write-Host "Parametre : ${MonParametre1}"

    # retourne de résultat de la fonction
    Write-Output "Valeur de retour"
}

# Get-Help Test-Parametres
#Get-Help Test-Parametres -Detailed
Get-Help Test-Parametres -Full
