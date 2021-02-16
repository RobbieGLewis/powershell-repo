$serverName = Read-Host -Prompt "Server:"


(Get-Date) - (Get-CimInstance Win32_OperatingSystem -ComputerName $serverName).LastBootupTime | ft

#   Peformance
#Get-Counter '\Memory\Available MBytes'
#Get-Counter '\Processor(_Total)\% Processor Time'
#Get-WmiObject Win32_Processor | Select-Object LoadPercentage | Format-List
# Processor utilization
#$Processor = (Get-WmiObject -ComputerName DC01 -Class win32_processor -ErrorAction Stop | Measure-Object -Property LoadPercentage -Average | Select-Object Average).Average
#Write-Host = $Processor
# Memory utilization
#$ComputerMemory = Get-WmiObject -ComputerName $Server -Class win32_operatingsystem -ErrorAction Stop
#$Memory = ((($ComputerMemory.TotalVisibleMemorySize - $ComputerMemory.FreePhysicalMemory)*100)/ $ComputerMemory.TotalVisibleMemorySize)
#While(10) {ps | sort -des cpu | Select-Object -f 15 | ft -a; sleep 1; Clear-Host}

ps | sort -des cpu | Select-Object -f 15 | Format-Table -a; sleep 1