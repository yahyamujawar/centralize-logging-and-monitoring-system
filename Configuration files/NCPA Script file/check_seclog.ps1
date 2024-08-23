# Script to fetch the last 10 entries from the Security log
$securityLogs = Get-EventLog -LogName Security -Newest 10 | 
                Select-Object TimeGenerated, EntryType, Source, EventID, Message

# Output the logs in a format that can be easily read and parsed
Write-Host "===== Security Logs ====="
$securityLogs | ForEach-Object {
    Write-Host "Time: $($_.TimeGenerated), Type: $($_.EntryType), Source: $($_.Source), EventID: $($_.EventID)"
    Write-Host "Message: $($_.Message)"
    Write-Host "----------------------------------------"
}
