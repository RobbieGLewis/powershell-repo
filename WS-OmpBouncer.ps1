<#
SYNOPSIS:
   Scheduled OMP bouncer tool - diagnostics and automated logins
AUTHOR:
   James Wylde - james.wylde@smurfitkappa.co.uk
VERSION:
   0.1
FUNCTIONALITY:
   Check if up, uptime and logged on users, server performance, kick all titled applications and kick all logged on users, reboot all, log in three users per three servers.
#>


#----------------------------------------------------------------------------------------#
#   Modules

Clear-Host


#----------------------------------------------------------------------------------------#
#   Vars

#$ompM1222 = UK-HUB3-M1222
#$ompM1213 = UK-HUB3-M1213
#$ompM1214 = UK-HUB3-M1214


#----------------------------------------------------------------------------------------#
#   Landing


Write-Host "`n `r "
Read-Host -Prompt "    Connect to OMP Servers... "


#----------------------------------------------------------------------------------------#
#   Menu bulk

function Show-Menu
{
     param (
           [string]$Title = "OMP Server Bouncer 5000"
     )
     Clear-Host
     Write-Host "`n `r "
     Write-Host "    $Title"
     Write-Host "`n `r "
     Write-Host "    1 - Ping."
     Write-Host "    2 - Uptime and current users."
#     Write-Host " 3 - CPU and MEMORY"
     Write-Host "    3 - Kill all apps and kick all users." 
     Write-Host "    4 - Reboot." 
     Write-Host "    5 - Log in."
     Write-Host "`n `r "
     Write-Host "    Q - Quit."
     Write-Host "`n `r "
}

#----------------------------------------------------------------------------------------#
#   Functions


Function function1 {

     Write-Host "    Pinging: UK-HUB3-M1222"
     ping UK-HUB3-M1222
     Write-Host "`n `r "
     Write-Host "`n `r "

     Write-Host "    Pinging: UK-HUB3-M1213"
     ping UK-HUB3-M1213
     Write-Host "`n `r "
     Write-Host "`n `r "

     Write-Host "    Pinging: UK-HUB3-M1214"
     ping UK-HUB3-M1214
     Write-Host "`n `r "
     Write-Host "`n `r "

     Write-Host "    Pinging: UK-HUB3-M1220"
     ping UK-HUB3-M1220

     
}

Function function2 {

     Write-Host "    Logged on users and uptime: UK-HUB3-M1222"
     SystemInfo /s UK-HUB3-M1222 | find "Boot Time:"
     Write-Host "`n `r "
     query user /server:UK-HUB3-M1222

     Write-Host "`n `r "
     Write-Host "`n `r "

     Write-Host "    Logged on users and uptime: UK-HUB3-M1213"
     SystemInfo /s UK-HUB3-M1213 | find "Boot Time:"
     Write-Host "`n `r "
     query user /server:UK-HUB3-M1213 

     Write-Host "`n `r "
     Write-Host "`n `r "

     Write-Host "    Logged on users and uptime: UK-HUB3-M1214"
     SystemInfo /s UK-HUB3-M1214 | find "Boot Time:"
     Write-Host "`n `r "
     query user /server:UK-HUB3-M1214 

     Write-Host "`n `r "
     Write-Host "`n `r "

     Write-Host "    Logged on users and uptime: UK-HUB3-M1220"
     SystemInfo /s UK-HUB3-M1220 | find "Boot Time:"
     Write-Host "`n `r "
     query user /server:UK-HUB3-M1220


     Write-Host "`n `r "
}


Function function4 {

     Write-Host "`n `r "

     Write-Host "    #######################################################   " -ForegroundColor White -BackgroundColor Red
     Write-Host "    # PROCEEDING WILL EFFECT LIVE SERVERS - ARE YOU SURE? #   " -ForegroundColor White -BackgroundColor Red
     Write-Host "    #######################################################   " -ForegroundColor White -BackgroundColor Red

     Write-Host "`n `r "


     $input2 = Read-Host "    Close all applications and kick all users from, M1222, M1213, M1214? [y/n]" 
     switch($input2){
               y{     Write-Host "    Ending applications and kicking all users..."

               Invoke-Command -ComputerName UK-HUB3-M1222 -ScriptBlock {Get-Process  -ComputerName UK-HUB3-M1222 | Where-Object {$_.MainWindowTitle -ne ""} | Stop-Process}
          
               Invoke-Command -ComputerName UK-HUB3-M1213 -ScriptBlock {Get-Process  -ComputerName UK-HUB3-M1213 | Where-Object {$_.MainWindowTitle -ne ""} | Stop-Process}
          
               Invoke-Command -ComputerName UK-HUB3-M1214 -ScriptBlock {Get-Process  -ComputerName UK-HUB3-M1214 | Where-Object {$_.MainWindowTitle -ne ""} | Stop-Process}

               Invoke-Command -ComputerName UK-HUB3-M1220 -ScriptBlock {Get-Process  -ComputerName UK-HUB3-M1214 | Where-Object {$_.MainWindowTitle -ne ""} | Stop-Process}
          
               Start-Sleep -Seconds 10
          
               Invoke-Command -ComputerName UK-HUB3-M1222 -ScriptBlock { logoff 1 }
               Invoke-Command -ComputerName UK-HUB3-M1222 -ScriptBlock { logoff 2 }
               Invoke-Command -ComputerName UK-HUB3-M1222 -ScriptBlock { logoff 3 }
               Invoke-Command -ComputerName UK-HUB3-M1222 -ScriptBlock { logoff 4 }
          
               Invoke-Command -ComputerName UK-HUB3-M1213 -ScriptBlock { logoff 1 }
               Invoke-Command -ComputerName UK-HUB3-M1213 -ScriptBlock { logoff 2 }
               Invoke-Command -ComputerName UK-HUB3-M1213 -ScriptBlock { logoff 3 }
               Invoke-Command -ComputerName UK-HUB3-M1213 -ScriptBlock { logoff 4 }
          
               Invoke-Command -ComputerName UK-HUB3-M1214 -ScriptBlock { logoff 1 }
               Invoke-Command -ComputerName UK-HUB3-M1214 -ScriptBlock { logoff 2 }
               Invoke-Command -ComputerName UK-HUB3-M1214 -ScriptBlock { logoff 3 }
               Invoke-Command -ComputerName UK-HUB3-M1214 -ScriptBlock { logoff 4 }

               Invoke-Command -ComputerName UK-HUB3-M1220 -ScriptBlock { logoff 1 }
               Invoke-Command -ComputerName UK-HUB3-M1220 -ScriptBlock { logoff 2 }
               Invoke-Command -ComputerName UK-HUB3-M1220 -ScriptBlock { logoff 3 }
               Invoke-Command -ComputerName UK-HUB3-M1220 -ScriptBlock { logoff 4 }
          
               Write-Host "    Done."
               }
               n{return}
         default{write-warning "    Y or N only."}
     }

}
#### add confirmation


Function function5 {

     Write-Host "`n `r "

     Write-Host "    #######################################################   " -ForegroundColor White -BackgroundColor Red
     Write-Host "    # PROCEEDING WILL EFFECT LIVE SERVERS - ARE YOU SURE? #   " -ForegroundColor White -BackgroundColor Red
     Write-Host "    #######################################################   " -ForegroundColor White -BackgroundColor Red

     Write-Host "`n `r "


     $input = Read-Host "    Reboot OMP servers M1222, M1213, M1214, M1220? [y/n]" 
     switch($input){
               y{
               Write-Host "    Restarting UK-HUB3-M1222..."
               Restart-Computer -ComputerName UK-HUB3-M1222 -Force -Confirm:$false

               Write-Host "    Restarting UK-HUB3-M1213..."
               Restart-Computer -ComputerName UK-HUB3-M1213 -Force -Confirm:$false

               Write-Host "    Restarting UK-HUB3-M1214..."
               Restart-Computer -ComputerName UK-HUB3-M1214 -Force -Confirm:$false

               Write-Host "    Restarting UK-HUB3-M1220..."
               Restart-Computer -ComputerName UK-HUB3-M1214 -Force -Confirm:$false

               }
               n{return}
         default{write-warning "    Y or N only."}
     }

}

function function6 {


cmdkey /generic:"UK-HUB3-M1222" /user:"g2-uk-sta1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1222

Start-Sleep -Seconds 1.5

cmdkey /generic:"UK-HUB3-M1222" /user:"g2-uk-dss1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1222

Start-Sleep -Seconds 1.5

cmdkey /generic:"UK-HUB3-M1222" /user:"g2-uk-nor1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1222

Start-Sleep -Seconds 1.5



cmdkey /generic:"UK-HUB3-M1213" /user:"g2-uk-wsm1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1213

Start-Sleep -Seconds 1.5

cmdkey /generic:"UK-HUB3-M1213" /user:"g2-uk-mar1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1213

Start-Sleep -Seconds 1.5

cmdkey /generic:"UK-HUB3-M1213" /user:"g2-uk-abe1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1213

Start-Sleep -Seconds 1.5




cmdkey /generic:"UK-HUB3-M1214" /user:"g2-uk-wau1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1214

Start-Sleep -Seconds 1.5

cmdkey /generic:"UK-HUB3-M1214" /user:"g2-uk-yat1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1214

Start-Sleep -Seconds 1.5

cmdkey /generic:"UK-HUB3-M1214" /user:"g2-uk-mol1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1214

Start-Sleep -Seconds 1.5




cmdkey /generic:"UK-HUB3-M1220" /user:"g2-uk-nor3-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1220


}


#----------------------------------------------------------------------------------------#
#    Menu key bindings

#    Notes on ('NoEcho,IncludeKeyUp') - this is currently dead when ran via ISE - apparent dependent key combo for ISE. Run in PS itself

do
{
     Show-Menu
     #$keyPress = $host.UI.RawUI.ReadKey().character        Does not work in ISE
     $keyPress = Read-Host
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
                function4
            } '4' {
                Clear-Host 
                function5
            } '5' {
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

#     $wmi_uptime = Get-WmiObject Win32_OperatingSystem -computer UK-HUB3-M1222
#     [System.Math]::Round(($wmi_uptime.ConvertToDateTime($wmi_uptime.LocalDateTime) â€“ $wmi_uptime.ConvertToDateTime($wmi_uptime.LastBootUpTime)).Minutes,0)



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
