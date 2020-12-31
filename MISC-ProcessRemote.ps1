#   James Wylde 2019
#   github.com/jameswylde

# Modules

Invoke-Command -ComputerName PC01 -Scriptblock {Stop-Process -Name "receiver.exe"}