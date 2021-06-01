$properties = @(
    @{n='When';e={$_.TimeCreated}},
    @{n='Who';e={$_.Properties[6].Value}},
    @{n='What/What';e={$_.Properties[0].Value}},
    @{n='How';e={$_.Properties[4].Value}}
)
Get-WinEvent -FilterHashTable @{LogName='System'; ID=1074} | 
Select-Object $properties | Sort-Object "$_.TimeCreated" | Format-Table -AutoSize