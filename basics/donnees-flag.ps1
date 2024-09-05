Get-Content -Path "donnees-flag.txt" | 
    ForEach-Object {
        if ( $_ -eq "Flag" ) { Write-Output "Trouvé mon Flag!" }
        else { Write-Output $_ }
    }