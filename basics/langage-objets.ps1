[int]$Age=22
$Age.GetType()
$Age.GetType().Name
$Age | Get-Member

$Title="enseignant"

Write-host "Longeur de $Title : " $Title.length

# $objet.CompareTo($test)
# 1: $objet > $test => $objet est après $test dans l'ordre alphabétique'
# 0: $objet = $test => chaines identiques
# -1: $objet < $test => $objet est avant $test dans l'ordre alphabétique'
Write-host "Résultat de comparaison : "$Title.CompareTo("étudiant")




$strVariable = [String]"Ma chaine de texte"
$strVariable.GetType()
$strVariable | Get-Member
$strVariable.Length
$strVariable


$intVariable = [Int]12
$intVariable.GetType()
$intVariable | Get-Member | ft
$intVariable



# instantiation automatique d'un objet de type 'String'
$MaVariableString = "test"

# instantiation manuelle d'un objet de type 'String'
$MaVariableString = New-Object -TypeName System.String -ArgumentList "test"

