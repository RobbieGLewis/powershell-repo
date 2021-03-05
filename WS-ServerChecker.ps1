#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules

Clear-Host

#----------------------------------------------------------------------------------------#
#   Vars
Write-Host "`n `r "
$serverName = Read-Host -Prompt "Machine"

$wmi_uptime = Get-WmiObject Win32_OperatingSystem -computer $serverName
[System.Math]::Round(($wmi_uptime.ConvertToDateTime($wmi_uptime.LocalDateTime) – $wmi_uptime.ConvertToDateTime($wmi_uptime.LastBootUpTime)).Minutes,0)


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

Function function2 {$wmi_uptime = Get-WmiObject Win32_OperatingSystem -computer $serverName
     [System.Math]::Round(($wmi_uptime.ConvertToDateTime($wmi_uptime.LocalDateTime) – $wmi_uptime.ConvertToDateTime($wmi_uptime.LastBootUpTime)).Minutes,0)}

Function function3 {Get-Process -ComputerName $serverName | Sort-Object -des cpu | Select-Object -f 15 | Format-Table -Autosize; Start-Sleep 1}

Function function4 {Get-Process  -ComputerName $serverName | Where-Object {$_.MainWindowTitle -ne ""} | Stop-Process}

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
     $keyPress = ($host.UI.RawUI.ReadKey('NoEcho,IncludeKeyUp')).character
     switch ($keyPress)
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
until ($keyPress -eq 'q')




#----------------------------------------------------------------------------------------#
#   Scraps


#----------------------------------------------------------------------------------------#
#   TBD
#Link functions to $serverName