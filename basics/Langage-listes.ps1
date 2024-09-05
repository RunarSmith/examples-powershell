$RainbowColor = "red", "orange", "yellow", "green", "blue", "indigo", "violet"
$a =  3, "apple", 3.1415926, "cat", 23
[int[]]$b = 51, 29, 88, 27,50
$b.SetValue(19, 3)
$b[-1]=888
$PeopleTable = @{“Merlin Lin" = “3725-3888"; “Linda Chen" = “0800-000-213" }

$b
$b[5]=666 # l'élément numéro 5 n'existe pas => error
$b += 666 # OK



$MaVaraible = @{ "fruit"="pomme"; "legume"="courgette" } 
$MaVaraible.fruit 
$MaVaraible.fruit = 123 

$MaVaraible["fruit"]
$MaVaraible += @{"truc"="machin"}

$MaVaraible
