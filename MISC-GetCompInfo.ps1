#   James Wylde

#----------------------------------------------------------------------------------------#
#   Modules

Invoke-Command -ComputerName 'DC01' -ScriptBlock { Get-ComputerInfo -Property *BIOS* }

##cmd

systeminfo.exe | find.exe /i "OS Version:"