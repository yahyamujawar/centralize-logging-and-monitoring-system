# Script to fetch the last 10 entries from the Microsoft-Windows-Windows Firewall With Advanced Security/Firewall log
$firewallLogs = Get-WinEvent -LogName "Microsoft-Windows-Windows Firewall With Advanced Security/Firewall" -MaxEvents 10 | 
                Select-Object TimeCreated, Id, LevelDisplayName, ProviderName, Message

# Output the logs in a format that can be easily read and parsed
Write-Host "===== Firewall Logs ====="
$firewallLogs | ForEach-Object {
    Write-Host "Time: $($_.TimeCreated), ID: $($_.Id), Level: $($_.LevelDisplayName), Provider: $($_.ProviderName)"
    Write-Host "Message: $($_.Message)"
    Write-Host "----------------------------------------"
}
