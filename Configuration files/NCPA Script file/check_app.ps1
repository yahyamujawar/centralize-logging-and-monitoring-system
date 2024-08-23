# Script to fetch the last 10 entries from the Application log
$applicationLogs = Get-EventLog -LogName Application -Newest 10 | 
                   Select-Object TimeGenerated, EntryType, Source, EventID, Message

# Output the logs in a format that can be easily read and parsed
Write-Host "===== Application Logs ====="
$applicationLogs | ForEach-Object {
    Write-Host "Time: $($_.TimeGenerated), Type: $($_.EntryType), Source: $($_.Source), EventID: $($_.EventID)"
    Write-Host "Message: $($_.Message)"
    Write-Host "----------------------------------------"
}
