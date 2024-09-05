$i = 0

Get-Service | ForEach-Object {
    
    # Traitement
    # ...

    $i = $i +1

    # on créer on nouvel objet contenant des champs issus des objets en entrée,
    # et on peut rajouter nos propres données
    [PSCustomObject]@{
        NomDuService = $_.ServiceName
        Statut = $_.Status
        Compteur = $i
    }

    # L'objet est ici ressorti sur la sortie "standard"
    # donc la sortie de la boucle foreach-object est donc une liste d'objets de type PSCustomObject
} | Where-Object { $_.Statut -eq "Running" } | Format-Table -AutoSize
