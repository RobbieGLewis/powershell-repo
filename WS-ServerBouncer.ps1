#   James Wylde 2020

#----------------------------------------------------------------------------------------#
#   Modules

Clear-Host


#----------------------------------------------------------------------------------------#
#   Vars



#----------------------------------------------------------------------------------------#
#   Landing

Start-Transcript -Path "C:\temp\transcript0.txt" -NoClobber
Write-Host "`n `r "
Read-Host -Prompt "    Connect to Servers... "


#----------------------------------------------------------------------------------------#
#   Menu bulk

function Show-Menu
{
     param (
           [string]$Title = "Server Bouncer 5000"
     )
     Clear-Host
     Write-Host "`n `r "
     Write-Host "    $Title"
     Write-Host "`n `r "
     Write-Host "    1 - Ping."
     Write-Host "    2 - Uptime and current users."
#     Write-Host " 3 - CPU and MEMORY"
     Write-Host "    3 - Kill all applications and kick all users." 
     Write-Host "    4 - Reboot." 
     Write-Host "    5 - Log in."
     Write-Host "`n `r "
     Write-Host "    Q - Quit."
     Write-Host "`n `r "
}

#----------------------------------------------------------------------------------------#
#   Functions


Function function1 {

     Write-Host "    Pinging: DC01"
     ping DC01
     Write-Host "`n `r "
     Write-Host "`n `r "

     Write-Host "    Pinging: DC01"
     ping DC01
     Write-Host "`n `r "
     Write-Host "`n `r "

     Write-Host "    Pinging: DC01"
     ping DC01

     Write-Host "`n `r "
     
}

Function function2 {

     Write-Host "    Logged on users and uptime: DC01"
     SystemInfo /s DC01 | find "Boot Time:"
     Write-Host "`n `r "
     query user /server:DC01

     Write-Host "`n `r "
     Write-Host "`n `r "

     Write-Host "    Logged on users and uptime: DC01"
     SystemInfo /s DC01 | find "Boot Time:"
     Write-Host "`n `r "
     query user /server:DC01 

     Write-Host "`n `r "
     Write-Host "`n `r "

     Write-Host "    Logged on users and uptime: DC01"
     SystemInfo /s DC01 | find "Boot Time:"
     Write-Host "`n `r "
     query user /server:DC01 

     Write-Host "`n `r "
}


Function function4 {

     Write-Host "`n `r "

     Write-Host "    #######################################################   " -ForegroundColor White -BackgroundColor Red
     Write-Host "    # PROCEEDING WILL EFFECT LIVE SERVERS - ARE YOU SURE? #   " -ForegroundColor White -BackgroundColor Red
     Write-Host "    #######################################################   " -ForegroundColor White -BackgroundColor Red

     Write-Host "`n `r "


     $input2 = Read-Host "    Close all applications and kick all users from, DC01, DC01, DC01? [y/n]" 
     switch($input2){
               y{     Write-Host "    Ending applications and kicking all users..."

               Invoke-Command -ComputerName DC01 -ScriptBlock {Get-Process  -ComputerName DC01 | Where-Object {$_.MainWindowTitle -ne ""} | Stop-Process}
          
               Invoke-Command -ComputerName DC01 -ScriptBlock {Get-Process  -ComputerName DC01 | Where-Object {$_.MainWindowTitle -ne ""} | Stop-Process}
          
               Invoke-Command -ComputerName DC01 -ScriptBlock {Get-Process  -ComputerName DC01 | Where-Object {$_.MainWindowTitle -ne ""} | Stop-Process}
          
               Start-Sleep -Seconds 10
          
               Invoke-Command -ComputerName DC01 -ScriptBlock { logoff 1, 2, 3, 4, 5 }
          
               Invoke-Command -ComputerName DC01 -ScriptBlock { logoff 1, 2, 3, 4, 5 }
          
               Invoke-Command -ComputerName DC01 -ScriptBlock { logoff 1, 2, 3, 4, 5 }
          
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


     $input = Read-Host "    Reboot servers DC01, DC01, DC01? [y/n]" 
     switch($input){
               y{
               Write-Host "    Restarting DC01..."
               Restart-Computer -ComputerName DC01 -Force -Confirm:$false

               Write-Host "    Restarting DC01..."
               Restart-Computer -ComputerName DC01 -Force -Confirm:$false

               Write-Host "    Restarting DC01..."
               Restart-Computer -ComputerName DC01 -Force -Confirm:$false
               }
               n{return}
         default{write-warning "    Y or N only."}
     }

}

function function6 {


cmdkey /generic:"DC01" /user:"NAME" /pass:"PASS"
mstsc /v:DC01

Start-Sleep -Seconds 1.5

cmdkey /generic:"DC01" /user:"NAME" /pass:"PASS"
mstsc /v:DC01

Start-Sleep -Seconds 1.5

cmdkey /generic:"DC01" /user:"NAME" /pass:"PASS"
mstsc /v:DC01

Start-Sleep -Seconds 1.5



cmdkey /generic:"DC01" /user:"NAME" /pass:"PASS"
mstsc /v:DC01

Start-Sleep -Seconds 1.5

cmdkey /generic:"DC01" /user:"NAME" /pass:"PASS"
mstsc /v:DC01

Start-Sleep -Seconds 1.5

cmdkey /generic:"DC01" /user:"NAME" /pass:"PASS"
mstsc /v:DC01

Start-Sleep -Seconds 1.5




cmdkey /generic:"DC01" /user:"NAME" /pass:"PASS"
mstsc /v:DC01

Start-Sleep -Seconds 1.5

cmdkey /generic:"DC01" /user:"NAME" /pass:"PASS"
mstsc /v:DC01

Start-Sleep -Seconds 1.5

cmdkey /generic:"DC01" /user:"NAME" /pass:"PASS"
mstsc /v:DC01




}


#----------------------------------------------------------------------------------------#
#    Menu key bindings

#    Notes on ('NoEcho,IncludeKeyUp') - this is currently dead when ran via ISE - apparent dependent key combo for ISE. Run in PS itself

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
           } '' {
                Clear-Host
                function3
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

#     $wmi_uptime = Get-WmiObject Win32_OperatingSystem -computer DC01
#     [System.Math]::Round(($wmi_uptime.ConvertToDateTime($wmi_uptime.LocalDateTime) – $wmi_uptime.ConvertToDateTime($wmi_uptime.LastBootUpTime)).Minutes,0)

#     Write-Host "CPU and MEM: DC01"
#     Get-Process -ComputerName UK-LIV1-L023572 | Sort-Object -des cpu | Select-Object -f 15 | Format-Table -Autosize; Start-Sleep 1
# Get-Process | Sort-Object -des cpu | Select-Object -f 15 | where {($_.Name -notlike "Teams")} | Format-Table -Autosize; Start-Sleep 1


#----------------------------------------------------------------------------------------##
#   CMDkeys

<#

#>

#----------------------------------------------------------------------------------------#
#   TBD
