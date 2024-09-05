$PSCulture #  stores the name of the UI language used on the system for elements such as the date, time, and currency.
$PSUICulture # stores the name of the UI language used on the system for user interface elements such as menus and text strings.


$msgTable = Data {
    #culture="en-US"
    ConvertFrom-StringData @'
    helloWorld = Hello, World.
    errorMsg1 = You cannot leave the user name field blank.
    promptMsg = Please enter your user name.
'@
}

$msgTable.helloWorld
