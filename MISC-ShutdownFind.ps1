$compName = Read-Host "Client Name"

cls

Write-Host "Who killed" $compName"?" -ForegroundColor White -BackgroundColor Black

$properties = @(
    @{n='When';e={$_.TimeCreated}},
    @{n='Who';e={$_.Properties[6].Value}},
    @{n='What/Why';e={$_.Properties[0].Value}},
    @{n='How';e={$_.Properties[4].Value.ToUpper()}} 
)
Get-WinEvent -ComputerName $compName -FilterHashTable @{LogName='System'; ID=1074} | 
Select-Object $properties | Sort-Object "$_.TimeCreated" | Format-Table -AutoSize