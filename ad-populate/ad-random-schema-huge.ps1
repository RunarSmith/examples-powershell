param( 
    [Parameter(Mandatory=$true)] $OutputJSONFile,
    [int]$UserCount,
    [int]$GroupCount,
    [int]$LocalAdminCount
 )

Write-Host "Getting Data Files..."
#Invoke-WebRequest -Uri https://raw.githubusercontent.com/dominictarr/random-name/master/first-names.txt -OutFile data-first-names.txt
Invoke-WebRequest -Uri https://raw.githubusercontent.com/hippy2094/random-name-generator/master/firstnames.txt -OutFile data-first_names.txt
Invoke-WebRequest -Uri https://raw.githubusercontent.com/hippy2094/random-name-generator/master/surnames.txt -OutFile data-last_names.txt
Invoke-WebRequest -Uri https://gist.githubusercontent.com/roycewilliams/4003707694aeb44c654bf27a19249932/raw/7afc95e02df629515960a3e45109e6f88db3a99e/rockyou-top15k.txt -OutFile data-passwords.txt

Set-Content -Value "Employees
Managers
Executives
Engineers
Researchers
Developers
Personnel
Sales
Marketing
Student
Lawyer
Operations" -Path data-group_names.txt


$group_names = [System.Collections.ArrayList](Get-Content "data-group_names.txt")
$first_names = [System.Collections.ArrayList](Get-Content "data-first_names.txt")
$last_names = [System.Collections.ArrayList](Get-Content "data-last_names.txt")
$passwords = [System.Collections.ArrayList](Get-Content "data-passwords.txt")

$groups = @()
$users = @()

# Default UserCount set to 5 (if not set)
if ( $UserCount -eq 0 ){
    $UserCount = 5
}

# Default GroupCount set to 5 (if not set)
if ( $GroupCount -eq 0 ){
    $GroupCount = 5
}

if ( $LocalAdminCount -ne 0){
    $local_admin_indexes = @()
    while (($local_admin_indexes | Measure-Object ).Count -lt $LocalAdminCount){
        
        $random_index = (Get-Random -InputObject (1..($UserCount)) | Where-Object { $local_admin_indexes -notcontains $_ } )
        $local_admin_indexes += @( $random_index )
        Write-Host "adding $random_index to local_admin_indexes $local_admin_indexes"
    }
}

for ( $i = 1; $i -le $GroupCount; $i++ ){
    $group_name = (Get-Random -InputObject $group_names)
    $group = @{ "name" = "$group_name" }
    $groups += $group
    $group_names.Remove($group_name)
}

for ( $i = 1; $i -le $UserCount; $i++ ){
    $first_name = (Get-Random -InputObject $first_names)
    $last_name = (Get-Random -InputObject $last_names)
    $password = (Get-Random -InputObject $passwords)

    $new_user = @{ `
        "firstname"="$first_name"
        "name"="$last_name"
        "displayname"="$first_name $last_name"
        "password"="$password"
        "groups" = (Get-Random -InputObject $groups).name
        }

    if ( $local_admin_indexes | Where { $_ -eq $i  } ){
        Write-Host "user $i is local admin"
        $new_user["local_admin"] = $true
    }

    $users += $new_user

    $first_names.Remove($first_name)
    $last_names.Remove($last_name)
    $passwords.Remove($password)
}

ConvertTo-Json -InputObject @{ 
    "domain"= "xyz.com"
    "groups"=$groups
    "users"=$users
} | Out-File $OutputJSONFile 
