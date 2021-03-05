#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules

Clear-Host


##

# MAP FUNCTIONS KEYS IN TUI AFTER TESTING

##


#----------------------------------------------------------------------------------------#
#   Vars

Write-Host "`n `r "
Write-Host "`n `r "
Read-Host -Prompt "Connect to OMP Servers..."

#$wmi_uptime = Get-WmiObject Win32_OperatingSystem -computer $serverName
#[System.Math]::Round(($wmi_uptime.ConvertToDateTime($wmi_uptime.LocalDateTime) – $wmi_uptime.ConvertToDateTime($wmi_uptime.LastBootUpTime)).Minutes,0)

#$ompM1222 = UK-HUB3-M1222
#$ompM1213 = UK-HUB3-M1213
#$ompM1214 = UK-HUB3-M1214


#----------------------------------------------------------------------------------------##
#   CMDkeys

<#
cmdkey /generic:"UK-HUB3-M1222" /user:"g2-uk-sta1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1222

cmdkey /generic:"UK-HUB3-M1222" /user:"g2-uk-dss1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1222

cmdkey /generic:"UK-HUB3-M1222" /user:"g2-uk-nor1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1222


cmdkey /generic:"UK-HUB3-M1213" /user:"g2-uk-wsm1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1213

cmdkey /generic:"UK-HUB3-M1213" /user:"g2-uk-mar1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1213

cmdkey /generic:"UK-HUB3-M1213" /user:"g2-uk-abe1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1213


cmdkey /generic:"UK-HUB3-M1214" /user:"g2-uk-sta1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1214

cmdkey /generic:"UK-HUB3-M1214" /user:"g2-uk-sta1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1214

cmdkey /generic:"UK-HUB3-M1214" /user:"g2-uk-sta1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1214

#>


#----------------------------------------------------------------------------------------#
#   Menu bulk

function Show-Menu
{
     param (
           [string]$Title = "OMP Server Bouncer 5000"
     )
     Clear-Host
     Write-Host "`n `r "
     Write-Host "*** $Title ***"
     Write-Host "`n `r "
     Write-Host "1 - Ping servers."
     Write-Host "2 - Get uptime."
     Write-Host "3 - Check CPU and MEMORY usage."
     Write-Host "4 - Kill all applications and kick all users." 
     Write-Host "5 - Reboot OMP servers." 
     Write-Host "6 - Log in"
     Write-Host "`n `r "
     Write-Host "Q - Quit."
     Write-Host "`n `r "
}

#----------------------------------------------------------------------------------------#
#   Functions


Function function1 {
     
     ping UK-HUB3-M1222
     ping UK-HUB3-M1213
     ping UK-HUB3-M1214
}

Function function2 {
     
     $wmi_uptime = Get-WmiObject Win32_OperatingSystem -computer UK-HUB3-M1222
     [System.Math]::Round(($wmi_uptime.ConvertToDateTime($wmi_uptime.LocalDateTime) – $wmi_uptime.ConvertToDateTime($wmi_uptime.LastBootUpTime)).Minutes,0)

     $wmi_uptime = Get-WmiObject Win32_OperatingSystem -computer UK-HUB3-M1213
     [System.Math]::Round(($wmi_uptime.ConvertToDateTime($wmi_uptime.LocalDateTime) – $wmi_uptime.ConvertToDateTime($wmi_uptime.LastBootUpTime)).Minutes,0)

     $wmi_uptime = Get-WmiObject Win32_OperatingSystem -computer UK-HUB3-M1224
     [System.Math]::Round(($wmi_uptime.ConvertToDateTime($wmi_uptime.LocalDateTime) – $wmi_uptime.ConvertToDateTime($wmi_uptime.LastBootUpTime)).Minutes,0)

}

Function function3 {
     
     
     Get-Process -ComputerName UK-HUB3-M1222 | Sort-Object -des cpu | Select-Object -f 15 | Format-Table -Autosize; Start-Sleep 1

     Get-Process -ComputerName UK-HUB3-M1213 | Sort-Object -des cpu | Select-Object -f 15 | Format-Table -Autosize; Start-Sleep 1

     Get-Process -ComputerName UK-HUB3-M1214 | Sort-Object -des cpu | Select-Object -f 15 | Format-Table -Autosize; Start-Sleep 1


}

Function function4 {


     Get-Process  -ComputerName UK-HUB3-M1222 | Where-Object {$_.MainWindowTitle -ne ""} | Stop-Process

     Get-Process  -ComputerName UK-HUB3-M1213 | Where-Object {$_.MainWindowTitle -ne ""} | Stop-Process

     Get-Process  -ComputerName UK-HUB3-M1214 | Where-Object {$_.MainWindowTitle -ne ""} | Stop-Process

     Start-Sleep -Seconds 15

     Invoke-Command -ComputerName UK-HUB3-M1222 -ScriptBlock { logoff 1 }

     Invoke-Command -ComputerName UK-HUB3-M1213 -ScriptBlock { logoff 1 }

     Invoke-Command -ComputerName UK-HUB3-M1214 -ScriptBlock { logoff 1 }

}

Function function5 {
    $confirmation = Write-Host "Are you sure you want to reboot the OMP servers NOW ?  [Y/N] " -ForegroundColor White -BackgroundColor Red -nonewline; Read-Host
while($confirmation -ne "y")
{
    if ($confirmation -eq 'n') {return}
    $confirmation = Write-Host "Reboot? [Y/N]" -ForegroundColor White -BackgroundColor Red -nonewline; Read-Host
}
    Write-Host = "Rebooting in 15 seconds." -ForegroundColor White -BackgroundColor Green
    Start-Sleep -Seconds 15
    Restart-Computer -ComputerName UK-HUB3-M1222 -Force
    Restart-Computer -ComputerName UK-HUB3-M1213 -Force
    Restart-Computer -ComputerName UK-HUB3-M1214 -Force


}

function function6 {


cmdkey /generic:"UK-HUB3-M1222" /user:"g2-uk-sta1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1222

cmdkey /generic:"UK-HUB3-M1222" /user:"g2-uk-dss1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1222

cmdkey /generic:"UK-HUB3-M1222" /user:"g2-uk-nor1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1222


cmdkey /generic:"UK-HUB3-M1213" /user:"g2-uk-wsm1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1213

cmdkey /generic:"UK-HUB3-M1213" /user:"g2-uk-mar1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1213

cmdkey /generic:"UK-HUB3-M1213" /user:"g2-uk-abe1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1213


cmdkey /generic:"UK-HUB3-M1214" /user:"g2-uk-sta1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1214

cmdkey /generic:"UK-HUB3-M1214" /user:"g2-uk-sta1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1214

cmdkey /generic:"UK-HUB3-M1214" /user:"g2-uk-sta1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1214




}


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
           } '' {
                Clear-Host
                function4
            } '' {
                Clear-Host 
                function5
            } '6' {
                Clear-Host 
                function6
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
# Check shutdown loop
# Check SystemMath
# Do we want to launch desktop bat without user interaction