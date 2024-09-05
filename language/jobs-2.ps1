$job = Start-Job -ScriptBlock {
    [int] $counter = 0
    while ($counter -lt 10) {
        Write-Output "Counter = $counter."
        Start-Sleep -Seconds 5
        $counter++
    }
}

# Getting the information back from the jobs
foreach($job in Get-Job){
    while ($job.State -eq "Running") {
        $result = Receive-Job -Job $job
        Write-Host $result
        Start-Sleep -Seconds 1
    }
}

Get-Job
