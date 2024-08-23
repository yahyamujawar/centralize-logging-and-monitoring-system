$firewallStatus = Get-NetFirewallProfile -Profile Domain,Public,Private

if ($firewallStatus.Enabled -contains $false) {
    Write-Host "One or more firewall profiles are disabled"
    exit 2
} else {
    Write-Host "All firewall profiles are enabled"
    exit 0
}
