#   James Wylde 2019
#   ferus-wylde@github

# Modules


Select-String -path "C:\temp\*.txt" -Pattern "wyldelab" -Context 0 | Select-Object -Last 1