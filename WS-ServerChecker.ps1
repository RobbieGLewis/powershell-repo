#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules

Clear-Host

#----------------------------------------------------------------------------------------#
#   Vars
Write-Host "`n `r "
$serverName = Read-Host -Prompt "Machine"

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
     Write-Host "1 - Ping machine."
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


Function function1 {ping $serverName}

Function function2 {(Get-Date -ComputerName $serverName) - (Get-CimInstance Win32_OperatingSystem -ComputerName $serverName).LastBootupTime | Format-Table -AutoSize}

Function function3 {Get-Process | Sort-Object -des cpu | Select-Object -f 15 | Format-Table -Autosize; Start-Sleep 1}

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
            } '5' {
                Clear-Host 
                function5
           } 'q' {
                return
           }
     }
     pause
}
until ($input -eq 'q')




#----------------------------------------------------------------------------------------#
#   Scraps


#----------------------------------------------------------------------------------------#
#   TBD
#Link functions to $serverName