#   James Wylde 2019
#   ferus-wylde@github

# Modules

Invoke-Command -ComputerName 'DC01' -ScriptBlock { Get-ComputerInfo -Property *BIOS* }