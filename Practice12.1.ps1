function countstart
{
    $start = Get-Service | Where-Object {$_.Status -eq "Running"}
    Write-Host "Total services in running state = $($start.Count)"
}

function countstop
{
    $stop = Get-Service | Where-Object {$_.Status -eq "Stopped"}
    Write-Host "Total services in stopped state = $($stop.Count)"
}

countstart
countstop