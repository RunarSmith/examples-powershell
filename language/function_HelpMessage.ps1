function Get-MyValue {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, HelpMessage = "Please provide a valid path")]
        [String]$Path
        )

    return 12
}


Get-MyValue

