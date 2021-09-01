<#
SYNOPSIS:
   Tool for common tasks in SysAdmin and Support 
AUTHOR:
   James Wylde - MIT Licence
VERSION:
   0.1.
#>


#----------------------------------------------------------------------------------------#
#   Modules

Import-Module ActiveDirectory

Clear-Host

#uk-mar1-w022862


#----------------------------------------------------------------------------------------#
#   Misc Vars

$dayGet = (get-date).DayOfWeek
$dateGet = Get-Date -f "dddd - dd/MM/yyyy - hh:MM"


#----------------------------------------------------------------------------------------#
#   Landing
Write-Host "`n `r "
Write-Host "`n `r "
Write-Host " _____________________________" -ForegroundColor White -BackgroundColor Black

Write-Host "" $dateGet -ForegroundColor White -BackgroundColor Black
Write-Host " Hello, $env:UserName   "  -ForegroundColor White -BackgroundColor Black


$machineNamefull = $(Write-Host "" -NoNewLine) + $(Write-Host " Target:" -ForegroundColor White -BackgroundColor Black "" -NoNewLine; Read-Host).ToUpper()
$machineName = $machineNamefull.Trim()



#----------------------------------------------------------------------------------------#
#   Menu bulk

function Show-Menu
{
     param (
           [string]$Title = $machineName
     )
     Clear-Host
     Write-Host "`n `r "
     Write-Host "    $Title    " -ForegroundColor White -BackgroundColor Red
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
     Write-Host "    M - McAffee & Snow"
     Write-Host "    L - LSpush"
     Write-Host "    Y - Active Directory Tools Menu"
     Write-Host "`n `r "
     Write-Host "    Q - Quit"
     Write-Host "`n `r "
}

#----------------------------------------------------------------------------------------#
#   Functions


function function1 {

     Write-Host "`n `r "
     Write-Host "  Pinging" $machineName -ForegroundColor White -BackgroundColor Red
     Write-Host "`n `r "
     ping $machinename
     Write-Host "`n `r "

}

function function2 {

Write-Host "`n `r "
    Write-Host "  PaExec opening for" $machineName -ForegroundColor White -BackgroundColor Red
    Write-Host "`n `r "

    $argumentList = "/k c:\temp\paexec.exe \\$machineName -s cmd.exe"
    Start-Process cmd.exe $argumentList
    Write-Host "`n `r "
}

function function3 {

     Write-Host "`n `r "
     Write-Host "  Starting PS-Session with" $machineName -ForegroundColor White -BackgroundColor Red
     Write-Host "`n `r "

     c:\temp\psservice.exe \\$machineName -accepteula start winrm

     if(!(Test-Connection $machineName -Count 2 -Quiet)) {
          "$machineName is not reachable." 
     }
     else {
          Start-Process -FilePath 'PowerShell.exe' -ArgumentList '-NoExit',"-command `"Enter-PSSession -ComputerName $machineName`""
     }

     Write-Host "`n `r "
}

function function4 {

     Write-Host "`n `r "
     Write-Host "  Uptime and users on" $machineName -ForegroundColor White -BackgroundColor Red
     Write-Host "`n `r "
     SystemInfo /s $machineName | find "Boot Time:"
     Write-Host "`n `r "
     query user /server:$machineName
     Write-Host "`n `r "

}

function function5 {

     Write-Host "`n `r "
     Write-Host "  Tracing route to" $machineName -ForegroundColor White -BackgroundColor Red
     Write-Host "`n `r "
     tracert $machineName 
     Write-Host "`n `r "
}

function function6 {

     Write-Host "`n `r "
     Write-Host "  Telnet check on" $machineName -ForegroundColor White -BackgroundColor Red
     Write-Host "`n `r "

     $ip = Read-Host = "IP"
     $portNo = Read-Host = "Port"


     Start-Process -FilePath 'telnet' -ArgumentList $ip,$portNo

     Write-Host "`n `r "
          
}

function function7 {

     Write-Host "`n `r "
     Write-Host "  Explorer opening on" $machineName -ForegroundColor White -BackgroundColor Red
     Write-Host "`n `r "

     explorer.exe \\$machineName\c$
     Write-Host "`n `r "
}

function function8 {

     Write-Host "`n `r "
     Write-Host "  Installed programs on" $machineName -ForegroundColor White -BackgroundColor Red
     Write-Host "`n `r "

     Invoke-Command -ComputerName $machineName -ScriptBlock {Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object Displayname, publisher, installdate} | Format-table -AutoSize

     Write-Host "`n `r "
}

function function9 {

     TRY{
     
          Write-Host "  Who shutdown" $machineName -ForegroundColor White -BackgroundColor Red
      
          $properties = @(
              @{n='When?';e={$_.timeCreated}},
              @{n='Who?';e={$_.properties[6].Value.ToUpper()}},
              @{n='How?';e={$_.properties[4].Value.ToUpper()}},
              @{n='What?';e={$_.properties[0].Value}}
          )
      
          Get-WinEvent -ComputerName $machineName -FilterHashTable @{LogName='System'; ID=1074} | 
          Select-Object $properties | Sort-Object "$_.timeCreated" -Descending | Format-Table -AutoSize # | Out-GridView
          Start-Sleep -Seconds 1.5
      
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

    Write-Host "  Largest files on" $machineName -ForegroundColor White -BackgroundColor Red

    c:\temp\psservice.exe \\$machineName -accepteula start winrm

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

     Send-MailMessage -From $senderEmail@smurfitkappa.co.uk -To $recipientEmail@smurfitkappa.co.uk -CC $senderEmail@smurfitkappa.co.uk  -Subject "Largest Files on $clientName for $userName" -BodyAsHtml $htmlBody -Attachments c:\temp\$fileName -DeliveryNotificationOption OnFailure -Credential (Get-Credential -Message "Enter the credentials for SENDER") -SmtpServer 'mail.eu.smurfitkappa.com' -Port 25

     Write-Host "`r`n"
     Write-Host "******************************************************************************" -ForegroundColor White -BackgroundColor Black
     Write-Host "Finished - Results are located c:\temp\$filename" -ForegroundColor White -BackgroundColor Black
     Write-Host "Sender will receive notification of successful sending via email.             " -ForegroundColor White -BackgroundColor Black
     Write-Host "******************************************************************************" -ForegroundColor White -BackgroundColor Black

     Write-Host "`r`n"

}

function functionX {

    Write-Host "  Kill Outlook profile on" $machineName -ForegroundColor White -BackgroundColor Red
    Write-Host "`n `r "
    
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


function functionM {

    Write-Host "  Updating McAffee and Snow inventory on" $machineName -ForegroundColor White -BackgroundColor Red
    Write-Host "`n `r "

    $argumentList2 =  "\\$machineName cmd /C ping -n 2 127.0.0.1 >NUL & echo Running McAffee Update & echo ------------------------ & cd C:\Program Files (x86)\McAfee\Endpoint Security\Threat Prevention & amcfg.exe /update & echo -- & echo Running SnowAgent Inventory Scan & echo ------------------------ & cd C:\Program Files\Snow Software\Inventory\Agent & snowagent.exe scan & ping -n 10 127.0.0.1 >NUL & echo Running SnowAgent Inventory Send & echo ------------------------ & echo Sent & snowagent.exe send & ping -n 10 127.0.0.1 >NUL & echo ------------------------ & echo Commands completed. & ping -n 10 127.0.0.1 >NUL"

    Start-Process C:\temp\paexec.exe -ArgumentList $argumentList2
    
    Write-Host "`n `r "

}

function functionL {

    Write-Host "  LanSweeper push on" $machineName -ForegroundColor White -BackgroundColor Red

    $argumentList3 = "\\$machineName -c lspush.exe"
    Start-Process C:\temp\paexec.exe -ArgumentList $argumentList3

    Write-Host "`n `r "

}

function functionY{

    
#----------------------------------------------------------------------------------------#
#   Modules

Clear-Host

#----------------------------------------------------------------------------------------#
#   Menu bulk

function Show-ADMenu
{
     param (
           [string]$Title = "Active Directory Tools"
     )
     Clear-Host
     Write-Host "`n `r "
     Write-Host "    $Title"
     Write-Host "`n `r "
     Write-Host "    1 - AD Group Members Export"
     Write-Host "    2 - AD Change Employeed ID"
     Write-Host "    3 - AD Copy Group Members to another Group" 
     Write-Host "    4 - AD Add all Members to a group from .txt" 
     Write-Host "    5 - "
     Write-Host "`n `r "
     Write-Host "    Q - Quit."
     Write-Host "`n `r "
}

#----------------------------------------------------------------------------------------#
#   Functions


Function functionAD1 {

    Write-Host - '******************************************************************' -ForegroundColor White -BackgroundColor Red
    Write-Host - '******************************************************************' -ForegroundColor White -BackgroundColor Red
    Write-Host - '**ENSURE RELEVANT PERMISSIONS HAVE BEEN SOUGHT BEFORE PROCEEDING**' -ForegroundColor White -BackgroundColor Red
    Write-Host - '******************************************************************' -ForegroundColor White -BackgroundColor Red
    Write-Host - '******************************************************************' -ForegroundColor White -BackgroundColor Red
    Write-Host "`n `r "
    Read-Host -Prompt "Press ENTER if confident your actions won't land you a P45"
    Write-Host "`n `r "

    Write-Host "  AD Group Member Export" -ForegroundColor White -BackgroundColor Red

    $adGroupname = Read-Host "Group name"

    try {

        Get-ADGroupMember "$adGroupname" | ForEach-Object  {Get-ADUser $_ -properties emailaddress} | Select-Object Name, SamAccountName, EmailAddress | Export-Csv -path C:\temp\ADGroupExport.csv

        Write-Host "`n `r "
    
        Write-Host "  Export will be located in c:\temp\ADGroupExport.csv" -ForegroundColor White -BackgroundColor Red

        Write-Host "`n `r "
        
    }
    catch [EXCEPTION]
    {
        Write-Host "`n `r "
        Write-Host "  Failed - either the name is wrong or some random error I couldn't catch." -ForegroundColor White -BackgroundColor Red
        Write-Host "`n `r "
    }
    
    Write-Host "`n `r "

}

Function functionAD2 {


        Write-Host - '******************************************************************' -ForegroundColor White -BackgroundColor Red
        Write-Host - '******************************************************************' -ForegroundColor White -BackgroundColor Red
        Write-Host - '**ENSURE RELEVANT PERMISSIONS HAVE BEEN SOUGHT BEFORE PROCEEDING**' -ForegroundColor White -BackgroundColor Red
        Write-Host - '******************************************************************' -ForegroundColor White -BackgroundColor Red
        Write-Host - '******************************************************************' -ForegroundColor White -BackgroundColor Red
        Write-Host "`n `r "
        Read-Host -Prompt "Press ENTER if confident your actions won't land you a P45"
        Write-Host "`n `r "

        Write-Host "  AD Change Employeed ID" -ForegroundColor White -BackgroundColor Red
        Write-Host "`n `r "

            $SearchUser = Read-Host -Prompt 'Search user'
            try {
                $Users = Get-Aduser -Filter "anr -like '$SearchUser'"
                if ($Users.count -gt 1){
                    Write-Host 'Multiple users were found.' -ForegroundColor Red -BackgroundColor Yellow
                    Write-Host 'Please select a user:' -ForegroundColor Red -BackgroundColor Yellow
                    for($i = 0; $i -lt $Users.count; $i++){
                        Write-Host "$($i): $($Users[$i].SamAccountName) | $($Users[$i].Name) | $($Users[$i].EmployeeID)"
                    }
                    Write-Host "`n `r "
                    $selection = Read-Host -Prompt 'Select user (0, 1, 2 etc.)'
                    Write-Host - ' '
                    $ResultUser = $Users[$selection]

                    Write-Host - ' '
                    $CurrentEmployeeNo = Get-ADUser $ResultUser -Properties employeeid | Select-Object employeeID
                    Write-Host - 'Current employee number:' $CurrentEmployeeNo
            
                    $EID = Read-Host -Prompt 'New employee number'
                        if ($EID) { 
                            Write-Host = "Employee ID change successful." -ForegroundColor White -BackgroundColor Green
                        } 
                        else { 
                            Write-Host = "Employee ID change unsuccessful." -ForegroundColor White -BackgroundColor Red
                        }
            
                    Set-ADUser $ResultUser -EmployeeID $EID
            
                    Write-Host "`n `r "
                
                }
                else {
                    Write-Host "`n `r "
                    Write-Host = "Is this a standard user account? Doubt it."
                }
            }
            catch [EXCEPTION] {
                Write-Host "`n `r "
                Write-Host "Did you even enter anything?"
                Write-Host "`n `r "
                
            }




}


Function functionAD3 {


        Write-Host - '******************************************************************' -ForegroundColor White -BackgroundColor Red
        Write-Host - '******************************************************************' -ForegroundColor White -BackgroundColor Red
        Write-Host - '**ENSURE RELEVANT PERMISSIONS HAVE BEEN SOUGHT BEFORE PROCEEDING**' -ForegroundColor White -BackgroundColor Red
        Write-Host - '******************************************************************' -ForegroundColor White -BackgroundColor Red
        Write-Host - '******************************************************************' -ForegroundColor White -BackgroundColor Red
        Write-Host "`n `r "
        Read-Host -Prompt "Press ENTER if confident your actions won't land you a P45"
        Write-Host "`n `r "

        Write-Host "  AD Copy Group Members to another Group" -ForegroundColor White -BackgroundColor Red
        Write-Host "`n `r "

        $credentials = Get-Credential -Message 'Enter a2/a1 credentials.'

        $sourceGroup = Read-Host -Prompt 'Enter name of group to copy members from'
        $destinationGroup = Read-Host -Prompt 'Enter name of group to copy members to'

        $users = Get-ADGroupMember -Identity $sourceGroup -Credential $credentials

        $startCount = (Get-ADGroupMember -Identity $destinationGroup).Count
        $newMembersCount = $users.Count

        foreach ($user in $users) {
            Add-ADGroupMember -Identity $destinationGroup -Members $user.distinguishedname -Credential $credentials
        }

        $endCount = (Get-ADGroupMember -Identity $destinationGroup).Count

        $newCount = $endCount - $startCount

        Write-Host "`n `r "

        Write-Host - "$newMembersCount users have been added to group $destinationGroup" -ForegroundColor White -BackgroundColor Green
        Write-Host - "$newCount NET TOTAL + $destinationGroup" -ForegroundColor White -BackgroundColor Green

        Write-Host "`n `r "
            
}


Function functionAD4 {



        Write-Host - '******************************************************************' -ForegroundColor White -BackgroundColor Red
        Write-Host - '******************************************************************' -ForegroundColor White -BackgroundColor Red
        Write-Host - '**ENSURE RELEVANT PERMISSIONS HAVE BEEN SOUGHT BEFORE PROCEEDING**' -ForegroundColor White -BackgroundColor Red
        Write-Host - '******************************************************************' -ForegroundColor White -BackgroundColor Red
        Write-Host - '******************************************************************' -ForegroundColor White -BackgroundColor Red
        Write-Host "`n `r "
        Read-Host -Prompt "Press ENTER if confident your actions won't land you a P45"
        Write-Host "`n `r "

        Write-Host "  AD Add all Members to a group from .txt" -ForegroundColor White -BackgroundColor Red
        Write-Host "`n `r "
        Write-Host "  Create a .txt file in c:\temp named 'users.txt' with usernames in a column" -ForegroundColor White -BackgroundColor Blue

        try {
            $users = Get-Content c:\temp\users.txt
            $destinationGroup = Read-Host "Group Name"
    
            $startCount = (Get-ADGroupMember -Identity $destinationGroup).Count
            $newMembersCount = $users.Count
    
            foreach ($user in $users) { 
                $userAdd = Get-ADUser $user
                Add-ADGroupMember -ID $destinationGroup -Members $userAdd 
    
            }
    
            $endCount = (Get-ADGroupMember -Identity $destinationGroup).Count
    
            $newCount = $endCount - $startCount
    
            Write-Host "$newMembersCount users have been added to group $destinationGroup" -ForegroundColor White -BackgroundColor Green
            Write-Host "$newCount Net total + $destinationGroup" -ForegroundColor White -BackgroundColor Green
        }
        catch [EXCEPTION]{
            Write-Host "Cannot find 'c:\temp\users.txt'"
        }

}

function functionAD5 {



}


#----------------------------------------------------------------------------------------#
#    Menu key bindings

do
{
     Show-ADMenu
     #$keyPress = $host.UI.RawUI.ReadKey().character        Does not work in ISE
     $keyPress = Read-Host
     switch ($keyPress)
     {
           '1' {
                Clear-Host
                functionAD1
            } '2' {
                Clear-Host
                functionAD2   
            } '3' {
                Clear-Host
                functionAD3
            } '4' {
                Clear-Host 
                functionAD4
            } '5' {
                Clear-Host 
                functionAD5
           } 'q' {
                return
           }
     }
     pause
}
until ($keyPress -eq 'q')
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
                Clear-Host 
                functionX
            } 'M' {
                Clear-Host 
                functionM
            } 'L' {
                Clear-Host 
                functionL
            } 'Y' {
                Clear-Host 
                functionY
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