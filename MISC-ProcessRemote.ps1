#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules

Invoke-Command -ComputerName PC01 -Scriptblock {Stop-Process -Name "receiver.exe"}