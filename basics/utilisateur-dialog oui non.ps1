
Write-Output "Voici un message Standard"
Write-Host "Voici un message Standard"
# Sortie avec de la couleur :
Write-Host "Bonjour, je vois la vie en vert." -BackgroundColor "Green" -ForegroundColor "Black"



$name = Read-Host 'What is your name?'




Add-Type -AssemblyName PresentationCore,PresentationFramework
$ButtonType = [System.Windows.MessageBoxButton]::YesNo
$MessageboxTitle = "Test pop-up message title"
$Messageboxbody = "Are you sure you want to stop this script execution?"
$MessageIcon = [System.Windows.MessageBoxImage]::Warning
[System.Windows.MessageBox]::Show($Messageboxbody,$MessageboxTitle,$ButtonType,$messageicon)




$title = "Backup"
$message = "Please select resources for backup!"
$option1 = New-Object System.Management.Automation.Host.ChoiceDescription "Personal &Account", "Account"
$option2 = New-Object System.Management.Automation.Host.ChoiceDescription "Personal &Folder", "Folder"
$option3 = New-Object System.Management.Automation.Host.ChoiceDescription "Personal &Database", "Database"
$option4 = New-Object System.Management.Automation.Host.ChoiceDescription "&Public Folder", "Public"
$options = [System.Management.Automation.Host.ChoiceDescription[]]($option1, $option2, $option3, $option4)
$backup=$host.ui.PromptForChoice($title, $message, $options, [int[]](1))





$title = "Login"
$message = "Please enter your information to login!"

$name = New-Object System.Management.Automation.Host.FieldDescription "Name"
$name.Label = "&Login Name"
$name.DefaultValue = "Guest"

$pwd = New-Object System.Management.Automation.Host.FieldDescription "Password"
$pwd.Label = "&Password"
$pwd.SetparameterType( [System.Security.SecureString] )
$pwd.HelpMessage = "Please type your Password."

$fields = [System.Management.Automation.Host.FieldDescription[]]($name, $pwd)
$login=$Host.UI.Prompt($title, $message, $fields)






$message = "You want to add a new employee to your organisation?"
$yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "Yes"
$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "No"
$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
$choice = $host.ui.PromptForChoice($title, $message, $options, 1)





$wshell = New-Object -ComObject Wscript.Shell
$wshell.Popup("Operation Completed",0,"Done",0x1)

