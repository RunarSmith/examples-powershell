function prompt {

    #Assign Windows Title Text
    $host.ui.RawUI.WindowTitle = "Current Folder: $pwd"

    # Keep only 3 top lovel folders from current path
    $CmdPromptCurrentFolder = (((Get-location).Path -split '\\') | Select-Object -last 3 ) -join '\'


    $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $Date = Get-Date -Format 'HH:mm:ss'

    # Test for Admin / Elevated
    $IsAdmin = (New-Object Security.Principal.WindowsPrincipal $CmdPromptUser).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

    # last command Id in history
    $LastCommand = Get-History -Count 1

    #Decorate the CMD Prompt

    Write-Host ("{0} [{1}] " -f ($LastCommand.Id +1),$Date ) -NoNewline -ForegroundColor Green
    if ($IsAdmin) {
        Write-host '!Elevated! ' -BackgroundColor DarkRed -ForegroundColor White -NoNewline
    }

    Write-Host ("{0} " -f $CmdPromptUser.Name) -BackgroundColor DarkBlue -ForegroundColor White -NoNewline

    Write-Host ("{0} " -f $CmdPromptCurrentFolder) -NoNewline

    return "PS > "
} #end prompt function
