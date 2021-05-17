#   James Wylde 2020

#----------------------------------------------------------------------------------------#
#   Modules


Select-String -path "C:\temp\*.txt" -Pattern "wyldelab" -Context 0 | Select-Object -Last 1

Get-ChildItem c:\temp\*.txt -Recurse | Select-String -Pattern WHATYOULOOKINGFOR 