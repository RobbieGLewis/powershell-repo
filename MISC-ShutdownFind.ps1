#   James Wylde

#----------------------------------------------------------------------------------------#
#   Modules


$compName = Read-Host "Client Name"

cls

Write-Host "Who killed" $compName"?" -ForegroundColor White -BackgroundColor Red

$properties = @(
    @{n='When';e={$_.timeCreated}},
    @{n='Who';e={$_.properties[6].Value.ToUpper()}},
    @{n='How';e={$_.properties[4].Value.ToUpper()}},
    @{n='What/Why';e={$_.properties[0].Value}}
    
)
Get-WinEvent -ComputerName $compName -FilterHashTable @{LogName='System'; ID=1074} | 
Select-Object $properties | Sort-Object "$_.timeCreated" -Descending | Format-Table -AutoSize


#Get-WinEvent -ComputerName $compName -FilterHashTable @{LogName='System'; ID=1074} | 
#Select-Object $properties | Sort-Object "$_.timeCreated" -Descending | Out-GridView
