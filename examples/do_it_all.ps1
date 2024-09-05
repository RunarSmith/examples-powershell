
$DomainController="WIN-2AVJRD352RA"
$DomainName="PATROUILLECORP"
$DomainUsername="Administrateur"

function Start-BallonNotification {
    param (
        [Parameter(Mandatory, HelpMessage = "Please provide a valid text")]
        [String]$Text
        )

    Add-Type -AssemblyName  System.Windows.Forms 

    $global:balloon = New-Object System.Windows.Forms.NotifyIcon 

    [void](Register-ObjectEvent -InputObject $global:balloon -EventName MouseDoubleClick -SourceIdentifier IconClicked  -Action {
      #Perform  cleanup actions on balloon tip
      $global:balloon.dispose()
      Unregister-Event -SourceIdentifier IconClicked
      Remove-Job -Name IconClicked
      Remove-Variable  -Name balloon  -Scope Global
    } -ErrorAction SilentlyContinue )

    $path = (Get-Process -id $pid).Path
    $global:balloon.Icon  = [System.Drawing.Icon]::ExtractAssociatedIcon($path) 

    $global:balloon.BalloonTipIcon  = [System.Windows.Forms.ToolTipIcon]::Warning 

    $global:balloon.BalloonTipText  = $Text
    $global:balloon.BalloonTipTitle  = "Attention $Env:USERNAME" 

    $global:balloon.Visible  = $true 

    $global:balloon.ShowBalloonTip(5000) 
}


Write-Output "[ ] Demande du mot de passe du compte"
$DomainCredential = Get-Credential -UserName "$DomainName\$DomainUsername" -Message "Authentification sur le domaine $DomainName"

Write-Output "[ ] Ouverture de la session avec le serveur distant"
$ServerSession = New-PSSession -ComputerName $DomainController -Credential $DomainCredential -ErrorAction Stop

Write-Output "[ ] Execution des commandes à distance"

$CommandOutput = Invoke-Command -Session $ServerSession -ScriptBlock {
    Import-Module ActiveDirectory

    $ADUser = Get-ADUser -Identity "Administrateur" -Properties * -erroraction Stop

    set-content -Path ("{0}/result.txt" -f $env:LOCALAPPDATA) -Value $( $ADUser | ConvertTo-Json )

    Write-Output "OK"
} -ErrorAction Stop

Write-Output "[ ] Resultat:"
Write-Output "$CommandOutput"

if ("OK" -eq $CommandOutput) {
    Write-Output "[ ] Affichage de la pop-up (OK)"
    Start-BallonNotification -Text "OK ! Yeaaaahhh !"
} else {
    Write-Output "[ ] Affichage de la pop-up, quelque chose s'est mal passé"
    Start-BallonNotification -Text "$CommandOutput"
}

Write-Output "[ ] Récupération du fichier de résultat"
Copy-Item -FromSession $ServerSession -Path C:\Users\$DomainUsername\AppData\Local\result.txt -Destination ./result.txt

Write-Output "[ ] Affichage du résultat"
Get-Content -Path ./result.txt
