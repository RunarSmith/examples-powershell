Write-Host -ForegroundColor Yellow "*************************`nLe JEU du Chiffre`n*************************"
$var = Get-Random -Minimum 1 -Maximum 10
$count = 5
$count2 = 0
$user = $null
$envUser = $env:USERNAME
[bool]$win = $false
$date = Get-Date
while ( ($user -ne $var) -and ($count -gt 0) )
{
    $user = [Int](Read-Host "`nSaisissez une valeur")
    $count = $count-1
    $count2++
    if($user -gt $var)
    {
        "Votre valeur est plus grande"
        "Il vous reste {0} essais" -f $count
    }
    elseif($user -lt $var)
    {
        "Votre valeur est plus petite."
        "Il vous reste {0} essais" -f $count
    }
}
if ($count -eq 0)
{
    Write-Host -ForegroundColor Red "Vous avez perdu !"
    $win = $false
}
elseif($count -ne 0)
{
    Write-Host -ForegroundColor Green "Vous avez trouvé !"
    $win = $true
}
if ($win -eq $true)
{
    $result = "Victoire"
}
elseif($win -eq $false)
{
    $result = "Défaite"
}
$fichier = Test-Path -path .\Formation.csv
if($fichier -eq $false)
{
    Add-Content -Path .\Formation.csv -value "Date;Utilisateurs;Résultat;Nombre d'essais;"
    Add-Content -Path .\Formation.csv -value "$date;$envUser;$result;$count2"
}
elseif($fichier -eq $true)
{
    Add-Content -Path .\Formation.csv -value "$date;$envUser;$result;$count2"
}
