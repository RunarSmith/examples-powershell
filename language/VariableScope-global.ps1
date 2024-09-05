$MaVariable1 = "modifiée ici"
$global:MaVariable2 = "modifiée là"

Write-Host ( "MaVariable par défaut: -{0}-" -f $global:MaVariable1 )
Write-Host ( "MaVariable avec global: -{0}-" -f $global:MaVariable2 )
