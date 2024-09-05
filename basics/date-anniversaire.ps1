$dateAnniversaire=[System.DateTime]::ParseExact("14/07/1789",'dd/MM/yyyy',$null)

$dateJour=Get-Date # Date du jour

$difference = $dateJour - $dateAnniversaire

# Ou bien, équivalent :
$difference = New-TimeSpan -End $dateJour -Start $dateAnniversaire

Write-Host "nombre de jours entre ces 2 dates : " $difference.Days
Write-Host "nombre total de jours entre ces 2 dates : " $difference.TotalDays

Write-Host "Wouah ! t'est vieux toi ! :)"

Write-Host "Tu as " ($difference.Days / 365 ) " ans !"
