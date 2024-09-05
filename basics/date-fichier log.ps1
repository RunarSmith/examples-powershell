$NomFichier = Get-Date -Format "fichierlog-yyyyMMdd-HHmm.log"
$NomFichier

$date = Get-Date
$NomFichier = "fichierlog-{0}{1}{2}-{3}{4}.log" -f $date.Year,$date.Month,$date.Day,$date.Hour,$date.Minute
$NomFichier

$NomFichier = "fichierlog-" + (Get-Date -Format "yyyyMMdd-HHmm") + ".log"
$NomFichier

