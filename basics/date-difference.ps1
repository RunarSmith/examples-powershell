$stringa="01/01/2020"
$stringb="01/01/1990"

$date1=[System.DateTime]::ParseExact($stringa,'MM/dd/yyyy',$null)
$date2=[System.DateTime]::ParseExact($stringb,'MM/dd/yyyy',$null)

$difference = $date1 - $date2

Write-Host "nombre de jours entre ces 2 dates : " $difference.Days
Write-Host "nombre d'heures entre ces 2 dates : " $difference.Hours
Write-Host "nombre de minutes entre ces 2 dates : " $difference.Minutes
Write-Host "nombre de secondes entre ces 2 dates : " $difference.Seconds
Write-Host "nombre de millisecondes entre ces 2 dates : " $difference.Milliseconds
Write-Host "nombre total de jours entre ces 2 dates : " $difference.TotalDays
Write-Host "nombre total de heures entre ces 2 dates : " $difference.TotalHours
Write-Host "nombre total de minutes entre ces 2 dates : " $difference.TotalMinutes
Write-Host "nombre total de secondes entre ces 2 dates : " $difference.TotalSeconds
Write-Host "nombre total de millisecondes entre ces 2 dates : " $difference.TotalMilliseconds
