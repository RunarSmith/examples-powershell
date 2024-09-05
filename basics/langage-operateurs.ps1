
123+789
222-876
34.5*44.2
13/7
123%5       # modulo: 123 = (5 * 24) + 3 = 120 + 3 => modulo retourne le restant, soit 3
$var++
$var--

$var=3
$var+=3
$var-=3
$var*=3
$var/=3
$var%=3
$var = 0x10
$var = 7.56e3
$var = 7MB

if ( 2 -eq 5 ) { Write-Host "OK" }

if ( (7 -eq 7) -and (2 -eq 5) ) { Write-Host "OK" }
if ( (7 -eq 7) -or (2 -eq 5) ) { Write-Host "OK" }          # OK
if ( (9 -eq 9) -xor (4 -eq 4) ) { Write-Host "OK" }
if ( (9 -eq 9) -xor (4 -eq 7) ) { Write-Host "OK" }         # OK
if ( (3 -eq 3) -and !(2 -eq 2) ) { Write-Host "OK" }
if ( (3 -eq 3) -and -not (2 -eq 9) ) { Write-Host "OK" }    #OK

if ( "aa" -eq "bb" ) { Write-Host "OK" }

$Var1 = 6
if ( $Var1 -eq 5 ) { Write-Host "OK" }
if ( $Var1 -gt 5 ) { Write-Host "OK" }                      # OK


$VarChaine = "Ma chaine de caractères"
if ( $VarChaine -like "*chaine*") { Write-Host "OK" }       # OK
if ( $VarChaine -match "[a-h]{3}") { Write-Host "OK" }       # OK 



$Variable = 4
if ( $null -eq $Variable ) {
    Write-Output "La variable vaut `$null"
}

if ( 8 -gt $Variable ) {
    Write-Output "La variable est > 8"
}

