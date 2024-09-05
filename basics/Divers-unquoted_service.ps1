Get-WmiObject -Class "win32_Service" -Property name,displayname,pathname,startmode | 
    Where-Object { $_.StartMode -eq "auto" } | 
    Where-Object { $_.pathname -notlike "C:\Windows\*" } |
    Where-Object { $_.pathname -notlike "`"*" } | 
    ForEach-Object { 
        Write-Output ("Service -{1}- : unquoted service path -{0}- ({2})" -f $_.pathname, $_.name,$_.displayname)
        $p = ""
        $_.pathname -split " " | 
            ForEach-Object {
                $p += " " + $_
                $p = $p.trim()
                $dir = split-path -path "$p" -parent
                Write-Output ("Testing folder: -{0}-" -f $dir)
                (get-acl -path "$dir").Access |
                    Where-Object { $_.IdentityReference -eq "BUILTIN\Utilisateurs" } | 
                    ForEach-Object { $_.FileSystemRights }
            }
        Write-Output ""
    }