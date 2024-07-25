


#logging
$logFile = "PingLogs.txt"
function Log-Message {
    param (
        [string]$message
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "$timestamp - $message"
    Write-Output $logEntry
    Add-Content -Path $logFile -Value $logEntry
}

# pass in host to test
function Ping-Host {
    param (
        [string]$targetHost
    )
    $pingResult = Test-Connection -ComputerName $targetHost -Count 1 -Quiet
    if (-not $pingResult) {
        Log-Message "Connection to $targetHost lost."
    }
    else {
        #Write-Output $pingResult
    } 
}

# Main
while ($true) {
    Ping-Host -targetHost "192.168.1.2" #Router/Firewall
    Ping-Host -targetHost "google.com"
    Start-Sleep -Seconds 15
}