$mypath = Split-Path $MyInvocation.MyCommand.Path -Parent

# Load Excel  file
$ExcelPath = Join-Path -Path $mypath -ChildPath "bonus-fichier.xlsx"
$Excel = New-Object -ComObject Excel.Application

$ExcelWordBook = $Excel.Workbooks.Open($ExcelPath)
$ExcelWorkSheet = $Excel.WorkSheets.item("Notes")

# Read Cell
$ExcelWorkSheet.Cells.Item(1,1).Text
$ExcelWorkSheet.Cells.Item(4,3).Text

## quit the workbook
$Excel.Quit()
