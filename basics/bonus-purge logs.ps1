
# On traitera les logs de + de 30 jours ( aujourd'hui - 30 jours)
$LogDateTrigger = (Get-Date).AddDays( -30 )
$Path = "D:\"

Get-ChildItem -Path $Path -Recurse | 
    Where-Object { 
        $_.LastWriteTime -lt $LogDateTrigger 
    }
    #  | Remove-Item -recurse -force -verbose




# On traitera les logs de + de 30 jours ( aujourd'hui - 30 jours)
$LogDateTrigger = (Get-Date).AddDays( -30 )
$Path = "D:\"

$creds = Get-Credential -Message "Administrateur host distant ?" -UserName "domain\${env:USERNAME}"
Invoke-Command -ComputerName remotehost.domain.loc -Credential $creds -ScriptBlock {
    $remoteDate=$args[0]
    $remotePath=$args[1]
    Get-ChildItem -Path $remotePath -Recurse | 
    Where-Object { 
        $_.LastWriteTime -lt $remoteDate 
    } # | Remove-Item -recurse -force -verbose
} -ArgumentList $LogDateTrigger,$Path

