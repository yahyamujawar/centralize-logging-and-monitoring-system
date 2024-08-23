# Get System Event Log
$systemEvents = Get-EventLog -LogName System -Newest 10
# Get Security Event Log
$securityEvents = Get-EventLog -LogName Security -Newest 10
# Output event details
$systemEvents | ForEach-Object { Write-Output "$($_.TimeGenerated) - $($_.EntryType) - $($_.Source) - $($_.Message)" }
$securityEvents | ForEach-Object { Write-Output "$($_.TimeGenerated) - $($_.EntryType) - $($_.Source) - $($_.Message)" }
