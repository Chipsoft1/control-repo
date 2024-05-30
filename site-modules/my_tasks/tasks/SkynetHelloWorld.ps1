$output = Write-Output "Hello, this is a test script from Puppet! Duane"
$output | Out-File -FilePath C:\Scripts\output-puppet.txt

Exit 0

$logPath = "C:\Scripts\ExampleScript.log"

function Write-Log {
    param ([string]$message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $logPath -Value "${timestamp}: $message"
}

Write-Log "Script Execution Started"

Write-Log "Running Command 1"

Write-Log "Script Execution Completed"
