$MaVariableA = "une chaine"
[String]$MaVariableB = "une autre chaine"
$MaVariableC = [String]"encore une autre chaine"

$MaVariableA.GetType()
$MaVariableB.GetType()
$MaVariableC.GetType()

$a=333				
$b="66"
$c=SS	        # "SS" n'est pas connu et génère une erreur			
$a.GetType()
$b.GetType().Name

$a+$b           # = 399 = [Int]333 + ([String]66 casté en [Int])
$b+$a           # = 33333 = [String]66 + ([Int]333 casté en [String])
