



(New-Object System.Net.WebClient).DownloadFile("https://duckduckgo.com/?q=nelson+mandela","D:\answer.html")


$reply = (New-Object System.Net.WebClient).DownloadString("https://duckduckgo.com/?q=nelson+mandela")
Write-Host $reply




$Response = Invoke-WebRequest -URI "https://duckduckgo.com/?q=nelson+mandela"
Write-Host "Titre de la page HTML: : "$Response.ParsedHtml.title
