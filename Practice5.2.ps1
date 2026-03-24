Get-ChildItem -Path "C:\Temp\Test"

$file = Get-ChildItem -Path "C:\Temp\Test" | Where-Object {$_.Name -like "*.csv"} | Select-Object Name, Length

$sizeinKB = $file.Length / 1KB
$sizeinMB = $file.Length / 1MB

Write-Host "`nFileName : $($file.Name)"
Write-Host "Size in KB : $sizeinKB"
Write-Host "Size in MB : $sizeinMB"