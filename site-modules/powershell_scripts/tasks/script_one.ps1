# PowerShell script content
$output = "Script 1 executed successfully"
$output | Out-File -FilePath C:\Scripts\script_1-puppet.txt
Write-Output $output

# Start of the script
$logPath = "C:\Scripts\ExampleScript.log"

# Function to write messages to the log file
function Write-Log {
    param ([string]$message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content2 -Path $logPath -Value "${timestamp}: $message"
}

# Log the start of the script
Write-Log "Script Execution Started"

# Sample command in the script
Write-Log "Running Command 1"

# Log the end of the script
Write-Log "Script Execution Completed"
