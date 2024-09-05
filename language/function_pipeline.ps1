function Invoke-MaFonction {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [System.Diagnostics.Process[]]$Process
    )

    BEGIN {
        Write-Output "Debut de fonction"
    }
    PROCESS {
        Write-Output $Process.Name
    }

    END {
        Write-Output "Fin de fonction"    
    }
}

$MaListe = Get-Process

$MaListe | Invoke-MaFonction
