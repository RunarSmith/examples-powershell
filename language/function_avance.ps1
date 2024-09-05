function Get-MyValue {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, HelpMessage = "Please provide a valid path")]
        [String]$Path
        )

    return 12
}

Get-Command -Name Get-MyValue -Syntax

(Get-Command -Name Get-MyValue).Parameters.Keys
