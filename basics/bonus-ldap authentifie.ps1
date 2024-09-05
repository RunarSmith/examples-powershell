$LdapServer = "nom du DC"
$Dom = "LDAP://${LdapServer}/DC=mycorp,DC=loc"
$objDomain = New-Object DirectoryServices.DirectoryEntry( $Dom, "mon username", “mon password")
$Searcher = New-Object DirectoryServices.DirectorySearcher
$Searcher.SearchRoot = $objDomain 

# samAccountType=805306368 = Objet User
$Searcher.filter="samAccountType=805306368"
$Result = $Searcher.FindAll()
$Result | ForEach-Object {
    Write-Host $_.Path
    $_.Properties | Format-Table -AutoSize
}
