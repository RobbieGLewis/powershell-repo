#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules

#### GB

Get-ChildItem -Recurse -ErrorAction SilentlyContinue | Sort-Object -Descending -Property Length | Select-Object -first 25 Name, @{Name="Size (GB) ";Expression={[Math]::Round($_.length / 1GB, 2)}} | Format-Table -Autosize

#### MB

Get-ChildItem -Recurse -ErrorAction SilentlyContinue | Sort-Object -Descending -Property Length | Select-Object -first 25 Name, @{Name="Size (MB) ";Expression={[Math]::Round($_.length / 1MB, 2)}} | Format-Table -Autosize

#### Export local c:\temp

Get-ChildItem -Recurse -ErrorAction SilentlyContinue | Sort-Object -Descending -Property Length | Select-Object -first 25 FullName, @{Name="Size (MB) ";Expression={[Math]::Round($_.length / 1MB, 2)}} | Export-CSV -Path C:\temp\largeFiles.csv

#### Invoke-Command to particular machine and particular user share

$clientName = Read-Host "Machine"
$userName = Read-Host "User"
Invoke-Command -ComputerName $clientName -ScriptBlock {Get-ChildItem c:\users\$using:userName\ -Recurse -ErrorAction SilentlyContinue | Sort-Object -Descending -Property Length | Select-Object -first 25 FullName, @{Name="Size (MB) ";Expression={[Math]::Round($_.length / 1MB, 2)}} | Export-CSV -NoTypeInformation -Path C:\temp\largeFiles.csv}