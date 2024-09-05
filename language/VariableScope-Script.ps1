
# Global : après exécution du script, la console aura conservé cette variable
$global:TrainingGlobalVariable = "Hello to all!"

# Script : à la fin du script, cette variable n'existera plus
$script:TrainingScriptVariable = "Hello from script"

# local: la vision courante
$local:TrainingLocalVariable = "Hello from here !"


function Show-TestChild {
    Write-Host "> Show-Test"
    Write-host $private:TrainingPrivateVariable

    Write-Host "< Show-Test"
}

function Show-TestPrivate {
    Write-Host "> Show-TestPrivate"

    # Cette variable n'est visible que dans cette fonction, ni le parent (script), ni l'enfant (fonction Show-TestChild)
    $private:TrainingPrivateVariable = "Who's there ?"
    Write-host $private:TrainingPrivateVariable
    Show-TestChild

    Write-Host "< Show-TestPrivate"
}

Show-TestPrivate
Write-host $private:TrainingPrivateVariable


Get-Variable -Scope script


