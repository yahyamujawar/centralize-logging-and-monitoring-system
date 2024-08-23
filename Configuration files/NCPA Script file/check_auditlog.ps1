# Script to fetch the last 10 entries from the Security (Audit) log
$auditLogs = Get-EventLog -LogName Security -Newest 10 | 
             Where-Object { $_.EventID -in 4688, 4624, 4634, 4670, 4672, 4720, 4722, 4723, 4724, 4725, 4726, 4728, 4731, 4732, 4733, 4735, 4737, 4740, 4767, 4771, 4780 } | 
             Select-Object TimeGenerated, EntryType, Source, EventID, Message

# Output the logs in a format that can be easily read and parsed
Write-Host "===== Audit Logs ====="
$auditLogs | ForEach-Object {
    Write-Host "Time: $($_.TimeGenerated), Type: $($_.EntryType), Source: $($_.Source), EventID: $($_.EventID)"
    Write-Host "Message: $($_.Message)"
    Write-Host "----------------------------------------"
}

