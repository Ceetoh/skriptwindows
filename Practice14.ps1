Set-ExecutionPolicy -Scope Process Bypass -Force

$name = Read-Host "Sisesta oma nimi"
$countInput = Read-Host "Mitu korda tervitust kuvada? (arv)"

if ($countInput -notmatch '^\d+$')
{
    Write-Host "VIGA: Palun sisesta arv." -ForegroundColor Red
    exit
}

[int]$count = $countInput

$reportPath = "$HOME\Downloads\report.txt"

$lines = @()
$lines += "Raport: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
$lines += ""

for ($i = 1; $i -le $count; $i++)
{
    $lines += "Tere, $name! ($i)"
}

$lines += ""
$lines += "Arvuti nimi: $env:COMPUTERNAME"
$lines += "Sisselogitud kasutaja: $env:USERNAME"
$lines += "PowerShelli versioon: $($PSVersionTable.PSVersion)"
$lines += ""

$lines += (Get-Process | Select-Object -First 3 Name, Id | Format-Table -AutoSize | Out-String).TrimEnd()
$lines += ""
$lines += (Get-Service | Select-Object -First 3 Name, Status | Format-Table -AutoSize | Out-String).TrimEnd()
$lines += ""

if ($PSVersionTable.PSVersion.Major -lt 5)
{
    $lines += "HOIATUS: PowerShelli versioon on alla 5!"
}
else
{
    $lines += "OK: PowerShelli versioon on sobiv."
}

$lines | Out-File -FilePath $reportPath -Encoding UTF8

$lines | ForEach-Object { Write-Host $_ }

Write-Host "==========================="
Write-Host "Script finished successfully"
Write-Host "==========================="