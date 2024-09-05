class Chien {
    [string]$Nom
}

$MonToutout = [Chien]::new()
$MonToutout.Nom = "Médor"
$MonToutout
