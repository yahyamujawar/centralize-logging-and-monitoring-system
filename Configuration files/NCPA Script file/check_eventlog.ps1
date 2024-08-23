# Script to fetch the last 10 entries from an Event Tracing log
# Modify 'Microsoft-Windows-Diagnostics-Performance/Operational' to the specific event trace log you want to monitor

$eventTracingLogs = Get-WinEvent -LogName "Microsoft-Windows-Diagnostics-Performance/Operational" -MaxEvents 10 | 
                     Select-Object TimeCreated, Id, LevelDisplayName, ProviderName, Message

# Output the logs in a format that can be easily read and parsed
Write-Host "===== Event Tracing Logs ====="
$eventTracingLogs | ForEach-Object {
    Write-Host "Time: $($_.TimeCreated), ID: $($_.Id), Level: $($_.LevelDisplayName), Provider: $($_.ProviderName)"
    Write-Host "Message: $($_.Message)"
    Write-Host "----------------------------------------"
}
