[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [String]$ParameterString,
    [Parameter(Mandatory=$false)]
    [Switch]$ParameterSwitch
)

function Test-Parametres {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [String]$MonParametre1
    )
    Write-Host "Parametre : ${MonParametre1}"

    # retourne de résultat de la fonction
    Write-Output "Valeur de retour"
}

if ( $False -eq $ParameterSwitch) {
    Write-Host "Le paramètre 'ParameterSwitch' n'a pas été fournit"
} else {
    Write-Host "Le paramètre 'ParameterSwitch' est actif"
}

$resultat = Test-Parametres -Monparametre1 $ParameterString

Write-Host "La fonction a retourné: "$resultat
