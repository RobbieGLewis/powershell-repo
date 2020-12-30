#   James Wylde 2019
#   ferus-wylde@github

# Modules

Invoke-Command -ComputerName PC01 -Scriptblock {Stop-Process -Name "receiver.exe"}