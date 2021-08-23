<#
SYNOPSIS:
   Tools for SysAdmin and Support work
AUTHOR:
   James Wylde - james.wylde@smurfitkappa.co.uk
VERSION:
   0.1.
#>


#----------------------------------------------------------------------------------------#
#   Modules

Clear-Host


#----------------------------------------------------------------------------------------#
#   Vars

$quoteList = 'Its always DNS','Users are liars'
$getQuote = Get-Random -InputObject $quoteList

#----------------------------------------------------------------------------------------#
#   Landing


Write-Host "`n `r "
$machineName = Read-Host -Prompt "Machine"


c:\temp\psservice.exe \\$machineName -accepteula start winrm


#----------------------------------------------------------------------------------------#
#   Menu bulk

function Show-Menu
{
     param (
           [string]$Title = $machineName
     )
     Clear-Host
     Write-Host "`n `r "
     Write-Host "    $Title"
     Write-Host "`n `r "
     Write-Host "    1 - Ping"
     Write-Host "    2 - PaExec"
     Write-Host "    3 - PSSession"
     Write-Host "    4 - Uptime & users"
     Write-Host "    5 - Tracert" 
     Write-Host "    6 - Telnet" 
     Write-Host "    7 - C$"
     Write-Host "    8 - Program list"
     Write-Host "    9 - Shutdown finder" 
     Write-Host "    Z - Email size report"
     Write-Host "    X - Outlook profile kill"
     Write-Host "`n `r "
     Write-Host "    Q - Quit."
     Write-Host "`n `r "
}

#----------------------------------------------------------------------------------------#
#   Functions


function function1 {

     Write-Host "    Pinging: " $machineName
     ping $machinename
     Write-Host "`n `r "
     Write-Host "`n `r "

     
}

function function2 {
    $argumentList = "/k c:\temp\paexec.exe \\$machineName -s cmd.exe"
    Start-Process cmd.exe $argumentList
}

function function3 {
     New-PSSession -ComputerName $machineName
}

function function4 {

     Write-Host "    Uptime and users:" $machineName
     SystemInfo /s $machineName | find "Boot Time:"
     Write-Host "`n `r "
     query user /server:$machineName

     Write-Host "`n `r "
     Write-Host "`n `r "

}

function function5 {

     Write-Host "    Tracing route:" $machineName
     tracert $machineName 
}

function function6 {

     $portNo = Read-Host = "Port"

     telnet $machineName $portNo
          
}

function function7 {

     explorer.exe \\$machineName\c$
}

function function8 {

     Invoke-Command -ComputerName $machineName -ScriptBlock {Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object Displayname, publisher, installdate} | Format-table -AutoSize
}

function function9 {

     TRY{
     
          Write-Host "Who killed" $machineName"?" -ForegroundColor White -BackgroundColor Red
      
          $properties = @(
              @{n='When?';e={$_.timeCreated}},
              @{n='Who?';e={$_.properties[6].Value.ToUpper()}},
              @{n='How?';e={$_.properties[4].Value.ToUpper()}},
              @{n='What?';e={$_.properties[0].Value}}
          )
      
          Get-WinEvent -ComputerName $machineName -FilterHashTable @{LogName='System'; ID=1074} | 
          Select-Object $properties | Sort-Object "$_.timeCreated" -Descending | Format-Table -AutoSize # | Out-GridView
          Start-Sleep -Seconds 1.5
      
          $timeUp =  SystemInfo /s $machineName /fo list | find /i "Boot Time:" 
      
          Write-Host "" $timeUp -ForegroundColor White -BackgroundColor Red
      }
      
      CATCH [Exception]
      {
          if ($_.Exception.GetType().Name -ne "RPC")
          {
              Write-Host "`n"
              Write-Host " :(  $machineName isn't reachable (RPC is unavailable) - try locally instead." -ForegroundColor White -BackgroundColor Red
              Write-Host "`n"
          }
      
      }
}
      
function functionZ {

     Clear-Host

     Write-Host "Query remote machine for largest 100 files - (Requires WinRM running on target machine)"
     Write-Host "`r`n"

     psservice.exe \\$machineName -accepteula start winrm

     Start-Sleep -Seconds 5  

     Write-Host "`r`n"
     $userName = Read-Host "User profile to query - C:\Users\"
     Write-Host "`r`n"
     $recipientEmail = Read-Host "Recipient email address ('@smurfitkappa.co.uk' not required)"
     Write-Host "`r`n"
     $senderEmail = Read-Host "Sender email address ('@smurfitkappa.co.uk' not required)"
     $fileName = "File Size Report-$userName-$(Get-Date -Format 'dd-MM-yyyy').csv"

     Invoke-Command -ComputerName $machineName -ScriptBlock {Get-ChildItem c:\users\$using:userName\ -Recurse -ErrorAction SilentlyContinue | Sort-Object -Descending -Property Length | Select-Object -first 100 FullName, @{Name="Size (MB) ";Expression={[Math]::Round($_.length / 1MB, 2)}}} | Export-CSV -Path C:\temp\$fileName -NoTypeInformation

     $htmlBody = "<html>
     <p>Hello, </p>
     <p>Please find attached a report detailing the largest files on your <em>C:\</em> drive.</p>
     <p>Consider the largest files that are no longer required for deletion, or by right-clicking the file and de-selecting <i>'Always keep on device'</i> so that it is stored in the OneDrive cloud instead. </p>
     <p>Should you have any personal files, these should not be stored on a corporate device, please move any (if any) to a personal device to ensure your device's security as well avoiding the risk of personal data loss.</p>
     <p>UK IT</p>
     <p><em>Note - this email was performed by a script and the results may not be without error.</em></p>
     <p><strong>_______________________________________________________________</strong></p>
     <p><strong>Service Desk</strong></p>
     <p><em>UK IT</em></p>
     <p>&hellip;</p>
     <p><strong>Smurfit Kappa </strong>UK</p>
     <p><em>3<sup>rd</sup> Floor, Cunard Building, Water Street, Liverpool, L3 1SF </em></p>
     <p>&hellip;</p>
     <p>Service Desk:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +44 (0) 345 023 0400</p>
     <p>Out Of Hours:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+44 (0) 788 523 1562</p>
     <p>&nbsp;</p>
     </html>
     "

     Send-MailMessage -From $senderEmail@smurfitkappa.co.uk -To $recipientEmail@smurfitkappa.co.uk -CC $senderEmail@smurfitkappa.co.uk  -Subject "Largest Files on $clientName for $userName" -BodyAsHtml $htmlBody -Attachments c:\temp\$fileName -DeliveryNotificationOption OnSuccess, OnFailure -Credential (Get-Credential -Message "Enter the credentials for SENDER") -SmtpServer 'mail.eu.smurfitkappa.com' -Port 25

     Write-Host "`r`n"
     Write-Host "******************************************************************************" -ForegroundColor White -BackgroundColor Black
     Write-Host "Finished - Results are located c:\temp\$filename" -ForegroundColor White -BackgroundColor Black
     Write-Host "Sender will receive notification of successful sending via email.             " -ForegroundColor White -BackgroundColor Black
     Write-Host "******************************************************************************" -ForegroundColor White -BackgroundColor Black

     Write-Host "`r`n"

}

function functionX {

     $userName = Read-Host "Username"

     Invoke-Command -ComputerName $machineName -ScriptBlock {

     Get-Process Lync* | Stop-Process -f
     Stop-Process -Name Outlook -Force
     taskkill /f /im ucmapi.exe

     Start-Sleep -S 5

     Move-Item -Path "C:\Users\$using:userName\AppData\Local\Microsoft\Outlook\*" -Destination 'C:\temp\' -Force

     Remove-Item -Path "C:\Users\$using:userName\AppData\Local\Microsoft\Outlook\*" 
     }
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
                function3
            } '4' {
                Clear-Host 
                function4
            } '5' {
                Clear-Host 
                function5
            } '6' {
                Clear-Host 
                function6
            } '7' {
                Clear-Host 
                function7
            } '8' {
                Clear-Host 
                function8
            } '9' {
                Clear-Host 
                function9
            } 'Z' {
                Clear-Host 
                functionZ
            } 'X' {
               C lear-Host 
                functionX
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
#     [System.Math]::Round(($wmi_uptime.ConvertToDateTime($wmi_uptime.LocalDateTime) Ã¢â‚¬â€œ $wmi_uptime.ConvertToDateTime($wmi_uptime.LastBootUpTime)).Minutes,0)



#----------------------------------------------------------------------------------------##

# Functions to add


<#
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

#               Invoke-Command -ComputerName UK-HUB3-M1220 -ScriptBlock {Get-Process  -ComputerName UK-HUB3-M1214 | Where-Object {$_.MainWindowTitle -ne ""} | Stop-Process}
          
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

#               Invoke-Command -ComputerName UK-HUB3-M1220 -ScriptBlock { logoff 1 }
#               Invoke-Command -ComputerName UK-HUB3-M1220 -ScriptBlock { logoff 2 }
#               Invoke-Command -ComputerName UK-HUB3-M1220 -ScriptBlock { logoff 3 }
#               Invoke-Command -ComputerName UK-HUB3-M1220 -ScriptBlock { logoff 4 }
          
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

#               Write-Host "    Restarting UK-HUB3-M1220..."
#               Restart-Computer -ComputerName UK-HUB3-M1214 -Force -Confirm:$false

               }
               n{return}
         default{write-warning "    Y or N only."}
     }

}



function function6 {


cmdkey /generic:"UK-HUB3-M1222" /user:"g2-uk-sta1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1222

Start-Sleep -Seconds 5

cmdkey /generic:"UK-HUB3-M1222" /user:"g2-uk-dss1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1222

Start-Sleep -Seconds 5

cmdkey /generic:"UK-HUB3-M1222" /user:"g2-uk-nor1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1222

Start-Sleep -Seconds 5



cmdkey /generic:"UK-HUB3-M1213" /user:"g2-uk-wsm1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1213

Start-Sleep -Seconds 5

cmdkey /generic:"UK-HUB3-M1213" /user:"g2-uk-mar1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1213

Start-Sleep -Seconds 5

cmdkey /generic:"UK-HUB3-M1213" /user:"g2-uk-abe1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1213

Start-Sleep -Seconds 5




cmdkey /generic:"UK-HUB3-M1214" /user:"g2-uk-wau1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1214

Start-Sleep -Seconds 5

cmdkey /generic:"UK-HUB3-M1214" /user:"g2-uk-yat1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1214

Start-Sleep -Seconds 5

cmdkey /generic:"UK-HUB3-M1214" /user:"g2-uk-mol1-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1214

Start-Sleep -Seconds 3




cmdkey /generic:"UK-HUB3-M1220" /user:"g2-uk-nor3-dispatch" /pass:"P@rtn3rP@rtn3r"
mstsc /v:UK-HUB3-M1220


}

#>