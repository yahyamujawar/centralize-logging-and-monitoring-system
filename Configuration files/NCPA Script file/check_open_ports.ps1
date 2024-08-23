param (
    [string]$hostname = "localhost",
    [int[]]$ports = @(80, 443, 22, 21, 23, 25, 53, 110, 143, 993, 995)
)

$openPorts = @()
foreach ($port in $ports) {
    $connection = Test-NetConnection -ComputerName $hostname -Port $port
    if ($connection.TcpTestSucceeded) {
        $openPorts += $port
    }
}

if ($openPorts.Count -gt 0) {
    Write-Host "Open Ports on ${hostname} - $($openPorts -join ', ')"
    exit 0
}
