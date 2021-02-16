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
     Write-Host "*************** $Title ***************"

     Write-Host "1 - Check uptime."
     Write-Host "2 - Check CPU and MEMORY usage."
     Write-Host "3 - Close all applications."
     Write-Host "4 - Reboot server."

     Write-Host "Q - Quit."
}

#----------------------------------------------------------------------------------------#
#   Functions

Function function1 {(Get-Date) - (Get-CimInstance Win32_OperatingSystem -ComputerName $serverName).LastBootupTime | Format-Table -AutoSize}

Function function2 {ps | sort -des cpu | Select-Object -f 15 | Format-Table -Autosize; sleep 1}

Function function3 {Get-Process | Where-Object {$_.MainWindowTitle -ne ""} | stop-process}

Function function4 {
    $confirmation = Read-Host "Are you sure you want to reboot" $serverName" ? [ Y / N ]"
while($confirmation -ne "y")
{
    if ($confirmation -eq 'n') {exit}
    $confirmation = Read-Host "Ready? [ Y / N ]"
}
    Write-Host = "Rebooting" $serverName "in 15 seconds."
    Start-Sleep 15 -Seconds 
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