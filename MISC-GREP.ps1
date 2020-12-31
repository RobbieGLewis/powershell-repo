#   James Wylde 2019
#   github.com/jameswylde

# Modules


Select-String -path "C:\temp\*.txt" -Pattern "wyldelab" -Context 0 | Select-Object -Last 1