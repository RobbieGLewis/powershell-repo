#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules

Invoke-Command -ComputerName 'DC01' -ScriptBlock { Get-ComputerInfo -Property *BIOS* }