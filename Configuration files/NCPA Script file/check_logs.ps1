# Script to fetch the last 10 events from the System log
Get-EventLog -LogName System -Newest 10 | Select-Object TimeGenerated, EntryType, Source, EventID, Message
