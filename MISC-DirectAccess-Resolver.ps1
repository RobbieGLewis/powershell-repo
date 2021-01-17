<#
SYNOPSIS:
   DirectAccess resolver with GUI for end-user resolution / troubleshooting.
AUTHOR:
   James Wylde
VERSION:
   1.0
FUNCTIONALITY:
   DirectAccess resolver with GUI. Stop / Start associated services [iphlpsvc & NcaSvc] > IPV6 release and forced reboot > Connection diagnosis > Recommended actions
#>

#----------------------------------------------------------------------------------------#

#  Execution policy - TBC

#Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser

#----------------------------------------------------------------------------------------#

#   Lost and Found

$newLine = "`r`n"

$service = Get-Service -Name iphlpsvc

<#

function serviceCheck{
   param($ipParam)
   $ipService = Get-Service -Name iphlpsvc
   if ($ipService.Status -eq "Running"){
      Write-Host "DynamicAccess is RUNNING."
   }
   if ($ipService.Status -eq "Stopped"){
      Write-Host "DyanmicAccess is NOT running. Please try again"
   }
}

serviceCheck

$serviceResult = & serviceCheck @$ipParam
#>

#----------------------------------------------------------------------------------------#

#   GUI objects

[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null

$mainForm = New-Object System.Windows.Forms.Form
$textBox = New-Object System.Windows.Forms.RichTextBox
$daResolver = New-Object System.Windows.Forms.Button
$daReboot = New-Object System.Windows.Forms.Button
$daDiagnostics = New-Object System.Windows.Forms.Button

#----------------------------------------------------------------------------------------#

#   Textbox OUT

$textBox.Location = '15,10'
$textBox.AutoSize = $false 
$textBox.Size = '450,140'
$textBox.ReadOnly = $true
$textBox.Multiline = $true
#$textBox.ForeColor = [Drawing.Color]::Red
$textBox.Text = Write-Output "Please select from the following options:"
$textBox.Font = "Microsoft Sans Serif, 9pt"
$textBox.appendText($newLine)
$textBox.appendText($newLine)
$textBox.appendText("•  Select 'Resolver' to attempt a quick-fix. ")
$textBox.appendText($newLine)
$textBox.appendText($newLine)
$textBox.appendText("•  Select 'Resolver + Reboot' to attempt a  more thorough fix involving a machine restart. ")
$textBox.appendText($newLine)
$textBox.appendText($newLine)
$textBox.appendText("•  Select 'Diagnostics' to attempt to troubleshoot wider issues.")

#----------------------------------------------------------------------------------------#

#   Button (M) DirectAccess Service Stop & Start

$daResolver.Text = 'Resolver'
$daResolver.Size = '140,23'
$daResolver.Font = "Microsoft Sans Serif, 9pt"
$daResolver.Location = '170,160'
$daResolver.Add_Click({

    Clear-Host
    Clear-Host
    Clear-Host
    Clear-Host
    
    $textBox.Text = Write-Output "DirectAccess is now restarting..."
    $textBox.appendText($newLine)
    $textBox.appendText($newLine)

    Stop-Service iphlpsvc -Force
    Stop-Service NcaSvc

    Start-Sleep -Seconds 0.5

    Start-Service iphlpsvc
    Start-Service NcaSvc

    
    Start-Sleep -Seconds 30
    Clear-Host
   
    $textBox.appendText("DirectAccess is $($service.Status)")


})

#----------------------------------------------------------------------------------------#

#   Button (R) iphlpsvc & NcaSvc Service Stop & Start, IPV6 release and forced reboot

$daReboot.Size = '140,23'
$daReboot.Location = '325,160'
$daReboot.text = 'Resolver + Reboot'
$daReboot.Font = "Microsoft Sans Serif, 9pt"
$daReboot.Add_Click({

    Clear-Host
    Clear-Host
    Clear-Host
    Clear-Host

    $textBox.Text = Write-Output "DirectAccess is now restarting and IPV6 being released..."
    $textBox.appendText($newLine)
    $textBox.appendText($newLine)

    Stop-Service iphlpsvc -Force
    Stop-Service NcaSvc

    Start-Sleep -Seconds 1

    Start-Service iphlpsvc
    Start-Service NcaSvc

    Start-Sleep -Seconds 1

    ipconfig.exe /release6

    Start-Sleep -Seconds 2

    ipconfig.exe /renew

    Start-Sleep -Seconds 25
    Clear-Host

    $textBox.ForeColor = [Drawing.Color]::Red
    $textBox.appendText( "Your machine will SHUTDOWN in 60 seconds. Please save all work.")
    $textBox.appendText($newLine)
    $textBox.appendText($newLine)
    Start-Sleep -Seconds 30

    $textBox.appendText( "Your machine will SHUTDOWN in 30 seconds. Please save all work.")
    $textBox.appendText($newLine)
    $textBox.appendText($newLine)
    Start-Sleep -Seconds 15

    $textBox.appendText( "Your machine will SHUTDOWN in 15 seconds. Please save all work.")
    $textBox.appendText($newLine)
    $textBox.appendText($newLine)
    Start-Sleep -Seconds 14

    $textBox.appendText( "Shutting down...")
    $textBox.appendText($newLine)

    Restart-Computer -Force
})

#----------------------------------------------------------------------------------------#

#   Button (L) Run 10mb download speedtest and WIFI signal strength

$daDiagnostics.Text = 'Diagnostics'
$daDiagnostics.Size = '140,23'
$daDiagnostics.Font = "Microsoft Sans Serif, 9pt"
$daDiagnostics.Location = '15,160'
$daDiagnostics.Add_Click({

    Clear-Host
    Clear-Host
    Clear-Host
    Clear-Host

    $textBox.Text = Write-Output "Running diagnostics..."
    $textBox.appendText($newLine)
    $textBox.appendText($newLine)

    $speedTest = "{0:N2} Mbit/sec" -f ((10/(Measure-Command {Invoke-WebRequest 'http://speed.transip.nl/10mb.bin' -UseBasicParsing|Out-Null}).TotalSeconds)*8)
    $signalTest = (netsh wlan show interfaces) -Match '^\s+Signal' -Replace '^\s+Signal\s+:\s+',''

     $textBox.appendText( "Internet download speed: $speedTest" )
     $textBox.appendText($newLine)
     $textBox.appendText( "WIFI signal strength: $signalTest" )
     $textBox.appendText($newLine)
     $textBox.appendText($newLine)
     $textBox.appendText( "For optimal DirectAccess performance, we recommend a download speed of 10Mbit/s or higher and a WIFI signal strength of 80% or higher. Please consider environmental factors to improve these should you not meet the minimum scores." )

})

#----------------------------------------------------------------------------------------#

#   Main form

$mainForm.Text = 'SK - DirectAccess Resolver'
$mainForm.Size = "485,220"
$mainForm.FormBorderStyle = 'FixedDialog'  
$mainForm.Font = "Microsoft Sans Serif, 9pt" 


$mainForm.Controls.Add($textBox)
$mainForm.Controls.Add($daResolver)
$mainForm.Controls.Add($daReboot)
$mainForm.Controls.Add($daDiagnostics)  


#----------------------------------------------------------------------------------------#

#   GUI OUT
$mainForm.ShowDialog()

#----------------------------------------------------------------------------------------#

#   Snippets
#   Str: (netsh wlan show interfaces) -Match '^\s+Signal' -Replace '^\s+Signal\s+:\s+',''

#----------------------------------------------------------------------------------------#

#  TBD
