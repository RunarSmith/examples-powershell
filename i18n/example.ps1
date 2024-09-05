<#

See: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_script_internationalization?view=powershell-7.2

C:\Scripts
C:\Scripts\exmaple.ps1
C:\Scripts\fr-FR\example.psd1
C:\Scripts\en-EN\example.psd1

#>


Write-Host "Culture par défaut"
Import-LocalizedData -BindingVariable msgTable

$msgTable.sunnyMsg1

Write-Host "Culture en-EN"
Import-LocalizedData -BindingVariable msgTable -UICulture en-EN

$msgTable.sunnyMsg1
