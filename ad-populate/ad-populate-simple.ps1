$mypath = Split-Path $MyInvocation.MyCommand.Path -Parent

# Output/Log level
$InformationPreference = 'Continue'

$OUUtilisateurs="Utilisateurs"
$OUGroupes="Utilisateurs"

$DomainRoot = "DC=mycorp,DC=loc"
$UserPath = "OU=$OUUtilisateurs,$DomainRoot"
$GroupsPath = "OU=$OUGroupes,$DomainRoot"

$TestOU = Get-ADOrganizationalUnit -Filter "distinguishedName -eq '$UserPath'"
if ( $TestOU ) {
    Write-Warning "OrganizationalUnit -$UserPath- existante"
} else {
    Write-Information "[ ] Creation de l'OrganizationalUnit -$UserPath-"
    New-ADOrganizationalUnit -Name "Utilisateurs" -Path $DomainRoot
}

$TestOU = Get-ADOrganizationalUnit -Filter "distinguishedName -eq '$GroupsPath'"
if ( $TestOU ) {
    Write-Warning "OrganizationalUnit -$GroupsPath- existante"
} else {
    Write-Information "[ ] Creation de l'OrganizationalUnit -$GroupsPath-"
    New-ADOrganizationalUnit -Name "Groupes" -Path $DomainRoot
}

Write-Information "[ ] Ajout des Utilisateurs"

Import-Csv -Path (Join-Path -Path $mypath -ChildPath "users.csv") -Delimiter ";" |
    ForEach-Object {
        $user = $_

        # trim de toutes les propriétés
        $user.PSObject.Properties | Foreach-Object {$_.Value = $_.Value.Trim()}  

        $Testuser = $null
        try {
            $Testuser = Get-ADUser -Identity $user.SamAccountName
        }
        catch {
        }

        if ( $Testuser ) {
            Write-Warning "Utilisateur -${user.SamAccountName}- existant: suppression"
            Remove-ADUser -Identity $user.SamAccountName -Confirm
        }
        Write-Information "[ ] Creation de l'Utilisateur -${user.SamAccountName}-"
        New-ADUser -Name $user.Name -GivenName $user.GivenName -SurName $user.SurName -DisplayName $user.DisplayName -SamAccountName $user.SamAccountName -UserPrincipalName $user.SamAccountName -Company $user.Company -Title $user.Title -Country $user.Country -State $user.State -City $user.City -Department $user.Department -Description $user.Description -EmailAddress $user.email -Enabled $True -Path $UserPath -AccountPassword $(ConvertTo-SecureString $user.Password -AsPlainText -Force)
    }

Write-Information "[ ] Ajout des Groupes"

Write-Information "[ ] Peuplement des Groupes"


