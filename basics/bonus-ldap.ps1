# domain courant
$domainObj = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
# Primary Domain Controller
$PDC = ($domainObj.PdcRoleOwner).Name
$SearchString = "LDAP://"
$SearchString += $PDC + "/"
$DistinguishedName = "DC=$($domainObj.Name.Replace('.', ',DC='))"
# Searchstring = "LDAP://<nom du serveur PDC>/DC=mycorp,DC=loc"
$SearchString += $DistinguishedName
$objDomain = New-Object System.DirectoryServices.DirectoryEntry
$Searcher = New-Object System.DirectoryServices.DirectorySearcher([ADSI]$SearchString)
$Searcher.SearchRoot = $objDomain
# samAccountType=805306368 = Objet User
$Searcher.filter="samAccountType=805306368"
$Result = $Searcher.FindAll()
$Result | ForEach-Object {
    Write-Host $_.Path
    $_.Properties | Format-Table -AutoSize
}
