$job1 = Start-Job -ScriptBlock {
    # named pipe - server
    $name = 'foo'
    $namedPipe = New-Object IO.Pipes.NamedPipeServerStream($name, 'Out')
    $namedPipe.WaitForConnection()

    $script:writer = New-Object IO.StreamWriter($namedPipe)
    $writer.AutoFlush = $true
    $writer.WriteLine('something')
    $writer.Dispose()

    $namedPipe.Dispose()
}

$job2 = Start-Job -ScriptBlock {
    # named pipe - client
    $name = 'foo'
    $namedPipe = New-Object IO.Pipes.NamedPipeClientStream('.', $name, 'In')
    $namedPipe.Connect()

    $script:reader = New-Object IO.StreamReader($namedPipe)
    Write-Output $reader.ReadLine()
    $reader.Dispose()

    $namedPipe.Dispose()
}

Wait-Job -Job $job1 | out-null
Wait-Job -Job $job2 | out-null

Write-Output "Client output :"
Receive-Job -Job $job2

Get-job | remove-job
