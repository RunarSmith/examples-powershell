[CmdletBinding()]
param (
    [Parameter()]
    [switch]$Export
)

$VisualStudioCodePath = "${env:USERPROFILE}\Documents\VisualStudioCode"
Write-host -ForegroundColor Blue "Path: $VisualStudioCodePath"

Write-Host -ForegroundColor Green "Downloading VSCode latest Version.."

Remove-Item -path "${env:USERPROFILE}\Documents\VisualStudioCode.zip" -Force -ErrorAction SilentlyContinue

Start-BitsTransfer -Source "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-archive" -Destination "${env:USERPROFILE}\Documents\VisualStudioCode.zip" -Description "Downloading VSCode from MS repo"

Write-Host -ForegroundColor Green "Unziping VSCode archive"

Remove-Item -path "$VisualStudioCodePath" -force -ErrorAction SilentlyContinue

Expand-Archive -Path "${env:USERPROFILE}\Documents\VisualStudioCode.zip" -DestinationPath "$VisualStudioCodePath"
# local 'data' folder to make it portable
New-Item -Path "$VisualStudioCodePath" -Name "data" -ItemType Directory | out-null

Write-Host -ForegroundColor Green "VSCode Version :"

Push-Location "${VisualStudioCodePath}"
Invoke-Expression -Command "./bin/Code.cmd --version"

Write-Host -ForegroundColor Green "Installing Extensions..."
"ms-vscode.powershell","ms-ceintl.vscode-language-pack-fr","GitHub.github-vscode-theme" | ForEach-Object {
    Invoke-Expression -Command "./bin/Code.cmd --install-extension $_ --force"
}

Write-Host -ForegroundColor Green "VSCode installed extensions :"

Invoke-Expression -Command "./bin/Code.cmd --list-extensions"

Write-Host -ForegroundColor Red "Please validate that fucking wizard (click `"Mark all done`"), then close to tool"
& "./bin/Code.cmd"

Read-Host "Press [ENTER] when done..."

Write-Host -ForegroundColor Red "Please let the tool a few seconds to kill him-self..."

Start-Sleep -Seconds 10

Pop-Location

Write-Host -ForegroundColor Green "Writting some settings for user"

Set-Content -Path "${VisualStudioCodePath}/data/user-data/User/settings.json" -Value "{
    `"workbench.colorTheme`": `"GitHub Dark Default`",
    `"telemetry.telemetryLevel`": `"error`"
}"

if ( $Export) {

    Write-Host -ForegroundColor Green "Compressing final VSCode archive..."
    Compress-Archive -Path "$VisualStudioCodePath" -DestinationPath "${env:USERPROFILE}\Documents\VisualStudioCode-with_Extensions.zip" -Force

    Write-Host -ForegroundColor Green "Cleaning..."
    Remove-Item -Path "$VisualStudioCodePath" -Recurse -Force
}

Write-Host -ForegroundColor Green "Job's done."
