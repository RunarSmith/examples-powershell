# on tue tous les jobs du contexte courrant
Get-Job | Remove-Job -force

function Invoke-Job01 {
        Write-Output "Debut du job 1"
        Get-Service | ft
        Start-Sleep -seconds 5
        Get-Service | ft
        Write-Output "Fin du job 1"
}

function Invoke-Job02 {
        Write-Output "Debut du job 2"
        Get-Process | ft
        Start-Sleep -seconds 3
        Get-Process | ft
        Write-Output "Fin du job 2"
}



# Invocation sequentielle
Get-Date
Invoke-Job01
Invoke-Job02
Get-Date
# durée d'exécution = durée job 1 + durée Job 2 = environ 8 secondes (12 secondes mesurées, du fait du temps de Get-Process et Get-Service)

Get-Date
$JobId01 = Start-Job -ScriptBlock { 
        Write-Output "Debut du job 1"
        Get-Service | ft
        Start-Sleep -seconds 5
        Get-Service | ft
        Write-Output "Fin du job 1"
    }
$JobId02 = Start-Job -ScriptBlock {
        Write-Output "Debut du job 2"
        Get-Process | ft
        Start-Sleep -seconds 3
        Get-Process | ft
        Write-Output "Fin du job 2"
    }
Wait-Job -Job $JobId01
Wait-Job -Job $JobId02
Get-Date
# Durée d'execution: le plus long des 2 jobs, donc environ 5 secondes (mesuré à 7 secondes)

Receive-Job -Job $JobId01
Receive-Job -Job $JobId02

# on tue tous les jobs du contexte courrant
Get-Job | Remove-Job -force
