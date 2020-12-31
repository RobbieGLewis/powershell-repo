#   James Wylde 2019
#   github.com/jameswylde

# Modules

Invoke-Command -ComputerName 'DC01' -ScriptBlock { Get-ComputerInfo -Property *BIOS* }