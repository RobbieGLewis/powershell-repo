$serverName = Read-Host -Prompt "Server Bouncer: "

function Show-Menu
{
     param (
           [string]$Title = $serverName
     )
     Clear-Host
     Write-Host "================ $Title ================"

     Write-Host "1 - Check uptime."
     Write-Host "2 - Check CPU and MEMORY usage."
     Write-Host "3 - Close all applications."
     Write-Host "4 - Reboot server."

     Write-Host "Q - Quit."
}

#Functions go here

Function function1 {(Get-Date) - (Get-CimInstance Win32_OperatingSystem -ComputerName $serverName).LastBootupTime | Format-Table -AutoSize}
Function function2 {ps | sort -des cpu | Select-Object -f 15 | Format-Table -Autosize; sleep 1}
Function function3 {Get-Process | Where-Object {$_.MainWindowTitle -ne ""} | stop-process}
Function function4 {
    Read-Host -Prompt "ARE YOU SURE YOU WANT TO REBOOT $servername ?"
    Restart-Computer -ComputerName $serverName -Force}

#Main menu loop
do
{
     Show-Menu
     $input = ($host.UI.RawUI.ReadKey('NoEcho,IncludeKeyUp')).character
     switch ($input)
     {
           '1' {
                Clear-Host
                function1
           } '2' {
                Clear-Host
                function2
           } '3' {
                Clear-Host
                function3
            } '4' {
                Clear-Host
                function4
           } 'q' {
                return
           }
     }
     pause
}
until ($input -eq 'q')



#(Get-Date) - (Get-CimInstance Win32_OperatingSystem -ComputerName $serverName).LastBootupTime | Format-Table -AutoSize

#ps | sort -des cpu | Select-Object -f 15 | Format-Table -Autosize; sleep 1






#       Scraps

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