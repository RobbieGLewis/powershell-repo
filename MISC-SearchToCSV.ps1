#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules

$var = Read-Host = "Search term"

Get-ChildItem -Path C:\ -Include $var -File -Recurse -ErrorAction SilentlyContinue

$results = Get-ChildItem -Path C:\ -Include $var -File -Recurse -ErrorAction SilentlyContinue | Export-CSV -Path C:\Temp\export.csv

Write-Host = "`r`n"

Write-Host = "Results are located C:\Temp\export.csv" -ForegroundColor Red -BackgroundColor Green