$hash1 = @{
    Name = @("John","Joe","Mary")
    DaysWorked = @(12,20,18)
}

$hash2 = @{
    Name = @("John","Joe","Mary")
    SalaryPerDay = @(100,120,150)
}

$JohnSalary = $hash1.DaysWorked[0] * $hash2.SalaryPerDay[0]
$JoeSalary = $hash1.DaysWorked[1] * $hash2.SalaryPerDay[1]
$MarySalary = $hash1.DaysWorked[2] * $hash2.SalaryPerDay[2]

$hash3 = @{
    Name = @("John","Joe","Mary")
    Salary = @($JohnSalary,$JoeSalary,$MarySalary)
}

$hash3