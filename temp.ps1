#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules

Clear-Host

#----------------------------------------------------------------------------------------#
#   Vars
Write-Host "`n `r "
$serverName = Read-Host -Prompt "Machine"
#$programRemove = Read-Host -Prompt "What program to uninstall?"

#----------------------------------------------------------------------------------------#
#   Menu bulk

function Show-Menu
{
     param (
           [string]$Title = $serverName
     )
     Clear-Host
     Write-Host "`n `r "
     Write-Host "*** $Title ***"
     Write-Host "`n `r "
     Write-Host "1 - Get installed programs."
     Write-Host "2 - Get uptime."
     Write-Host "3 - Check CPU and MEMORY usage."
     Write-Host "4 - Kill all titled applications." 
     Write-Host "5 - Reboot machine." 
     Write-Host "`n `r "
     Write-Host "Q - Quit."
     Write-Host "`n `r "
}

#----------------------------------------------------------------------------------------#
#   Functions

#Get-WmiObject -Class Win32_Product | Select-Object -Property Name



#$computername = "DC01"

#Get-WmiObject Win32_Product -ComputerName $computername | Select-Object -Property IdentifyingNumber, Name

Function function1 {Get-WmiObject Win32_Product -ComputerName $serverName | Select-Object -Property IdentifyingNumber, Name}

Function function2 {$removeMe = Get-WmiObject -Class Win32_Product -ComputerName $serverName| Where-Object{$_.Name -eq $programRemove }} 

Function function3 {$removeMe.Uninstall()}

Function function4 {Get-Process | Where-Object {$_.MainWindowTitle -ne ""} | Stop-Process}

Function function5 {
    $confirmation = Write-Host "Are you sure you want to reboot" $serverName" ?  [Y/N] " -ForegroundColor White -BackgroundColor Red -nonewline; Read-Host
while($confirmation -ne "y")
{
    if ($confirmation -eq 'n') {return}
    $confirmation = Write-Host "Reboot? [Y/N]" -ForegroundColor White -BackgroundColor Red -nonewline; Read-Host
}
    Write-Host = "Rebooting" $serverName "in 15 seconds." -ForegroundColor White -BackgroundColor Green
    Start-Sleep -Seconds 15
    Restart-Computer -ComputerName $serverName -Force}


#----------------------------------------------------------------------------------------#
#   Menu loop

do
{
     Show-Menu
     $this = ($host.UI.RawUI.ReadKey('NoEcho,IncludeKeyUp')).character
     switch ($this)
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
            } '5' {
                Clear-Host 
                function5
           } 'q' {
                return
           }
     }
     pause
}
until ($this -eq 'q')




#----------------------------------------------------------------------------------------#
#   Scraps


#----------------------------------------------------------------------------------------#
#   TBD
#Link functions to $serverName