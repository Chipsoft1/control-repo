param (
    [Parameter(Mandatory)]
    [string]$klantcode
)

Write-Host
$output = Write-Output "Dit is de nieuwe klantcode $klantcode"
$output | Out-File -FilePath C:\Scripts\output-Puppet_param.txt
Exit 0

# Start of the script
$logPath = "C:\Scripts\ExampleScriptPuppet_param.log"

# Function to write messages to the log file
function Write-Log {
    param ([string]$message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $logPath -Value "${timestamp}: $message"
}

# Log the start of the script
Write-Log "Script Execution Started"

# Sample command in the script
Write-Log "Running Command 1"
# [Place your existing script commands here]

# Log the end of the script
Write-Log "Script Execution Completed"
