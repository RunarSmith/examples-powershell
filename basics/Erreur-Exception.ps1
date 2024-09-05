$v1 = "azerty"
$v2 = [Int]$v1 




$v1 = "azerty"
try {
    $v2 = [Int]$v1
}
catch {
    Write-Output "Ca ne va pas !"
}





$v1 = "azerty"
try {
    $v2 = [Int]$v1
}
catch [InvalidCastException] {
    Write-Output "Un [String] n'est pas un [Int] !"
}
catch {
    Write-Output "On ne sait pas pourquoi..."
}
