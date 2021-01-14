<#
.SYNOPSIS
   DirectAccess one-click resolver with GUI for end-user resolution / troubleshooting.
.AUTHOR
   James Wylde
.VERSION
   1.0
.FUNCTIONALITY
   DirectAccess resolver with GUI. Stop / Start associated services [iphlpsvc & NcaSvc] > IPV6 release and forced reboot > Connection diagnosis.
#>


#   Lost and Found
$newLine = "`r`n"


[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null

$mainForm = New-Object System.Windows.Forms.Form
$textBox = New-Object System.Windows.Forms.TextBox
$daResolver = New-Object System.Windows.Forms.Button
$daReboot = New-Object System.Windows.Forms.Button
$daDiagnostics = New-Object System.Windows.Forms.Button


#   Textbox OUT
$textBox.Location = '15,10'
$textBox.AutoSize = $false 
$textBox.Size = '450,200'
$textBox.ReadOnly = $true
$textBox.Multiline = $true

#   Button (M) DirectAccess Service Stop & Start
$daResolver.Text = 'Resolver'
$daResolver.Size = '140,23'
$daResolver.Location = '170,220'
$daResolver.Add_Click({

    Clear-Host
    
    $textBox.Text = Write-Output "DirectAccess is now restarting..."
    $textBox.appendText($newLine)

    Stop-Service iphlpsvc -Force
    Stop-Service NcaSvc

    Start-Sleep -Seconds 1

    Start-Service iphlpsvc
    Start-Service NcaSvc

    
    Start-Sleep -Seconds 25
    Clear-Host

    $textBox.appendText("DirectAccess is now RUNNING. You can now close this application.")
})

#   Button (R) iphlpsvc & NcaSvc Service Stop & Start, IPV6 release and forced reboot
$daReboot.Size = '140,23'
$daReboot.Location = '325,220'
$daReboot.text = 'Resolver + Reboot'
$daReboot.Add_Click({

    Clear-Host

    $textBox.Text = Write-Output "DirectAccess is now restarting and IPV6 being released..."
    $textBox.appendText($newLine)

    Stop-Service iphlpsvc -Force
    Stop-Service NcaSvc

    Start-Sleep -Seconds 1

    Start-Service iphlpsvc
    Start-Service NcaSvc

    Start-Sleep -Seconds 1

    ipconfig.exe /release6
    ipconfig.exe /renew

    Start-Sleep -Seconds 25
    Clear-Host

    $textBox.appendText( "Your machine will SHUTDOWN in 60 seconds. Please save all work.")
    $textBox.appendText($newLine)
    Start-Sleep -Seconds 30

    $textBox.appendText( "Your machine will SHUTDOWN in 30 seconds. Please save all work.")
    $textBox.appendText($newLine)
    Start-Sleep -Seconds 15

    $textBox.appendText( "Your machine will SHUTDOWN in 15 seconds. Please save all work.")
    $textBox.appendText($newLine)
    Start-Sleep -Seconds 15


    Restart-Computer -Force
})

#   Button (L) Run 10mb download speedtest and WIFI signal strength
$daDiagnostics.Text = 'Diagnostics'
$daDiagnostics.Size = '140,23'
$daDiagnostics.Location = '15,220'
$daDiagnostics.Add_Click({

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
     $textBox.appendText( "For optimal DirectAccess performance, we recommend a download speed of 10Mbit/s or higher and a WIFI signal strength of 80% or higher. Please consider environmental factors to improve these." )

})


$mainForm.Text = 'Direct Access Resolver'
$mainForm.Size = "485,280"
$mainForm.FormBorderStyle = 'FixedDialog'   


$mainForm.Controls.Add($textBox)
$mainForm.Controls.Add($daResolver)
$mainForm.Controls.Add($daReboot)
$mainForm.Controls.Add($daDiagnostics)


$mainForm.ShowDialog()


#   Snippets