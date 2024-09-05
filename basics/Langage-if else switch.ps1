$Variable = 6

if ( 8 -gt $Variable ) {
    Write-Output "La variable est < 8"
} else {
    Write-Output "La variable est >= 8"
}

if ( 8 -le $Variable ) {
    Write-Output "La variable est >= 8"
} elseif ( 1 -gt $Variable ) {
    Write-Output "La variable est <= 1"
} else {
    Write-Output "La variable est <= 8 et > 1"
}

$TriggerHigh = 8
$TriggerLow = 1
if ( $Variable -ge $TriggerHigh ) {
    Write-Output "La variable est >= $TriggerHigh"
} elseif ( $Variable -le $TriggerLow ) {
    Write-Output "La variable est <= $Triggerlow"
} else {
    Write-Output "La variable est <= $TriggerHigh et > $TriggerLow"
}

switch ($Variable) {
    10 { Write-Host "10" }
    8 { Write-Host "8" }
    $TriggerHigh { Write-Host "$TriggerHigh !" }
    Default { Write-Host "Default" }
}
    