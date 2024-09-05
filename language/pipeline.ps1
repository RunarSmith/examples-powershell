
# on identifie le type d'objet retournée par Get-Process :
# Get-Process | gm

function Invoke-Pipeline001 {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [System.Diagnostics.Process[]]$Process,

        [Parameter(Mandatory=$false)]
        [switch]$ID10000
    )

    BEGIN {
        Write-Output "********** Debut de fonction **********"
    }
    PROCESS {
        if ($_.name -eq "svchost") {
            Write-Host -ForegroundColor Red ( "{0} - {1}" -f $_.ID, $_.Name)
        }  elseif ($_.name -eq "conhost") {
            Write-Host -ForegroundColor Green ( "{0} - {1}" -f $_.ID, $_.Name)
        } else {
            if ($ID10000 -and ( $_.ID -lt 10000) ) {
                Write-Host -ForegroundColor Yellow ( "{0} - {1}" -f $_.ID, $_.Name)
            } else {
                Write-Host ( "{0} - {1}" -f $_.ID, $_.Name)
            }
        }
        
    }

    END {
        Write-Output "********** Fin de fonction **********"
    }
}

Get-Process | Invoke-Pipeline001

Get-Process | Invoke-Pipeline001 -ID10000

