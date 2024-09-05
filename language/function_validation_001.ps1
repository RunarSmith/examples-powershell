function Test-MrParameterValidation {
    [CmdletBinding()]
    param (
        [string]$ComputerName
    )
    Write-Output $ComputerName
}

Test-MrParameterValidation -ComputerName Server01, Server02
