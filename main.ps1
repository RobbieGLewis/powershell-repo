
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null

$mainForm = New-Object System.Windows.Forms.Form
$textBox = New-Object System.Windows.Forms.TextBox
$daResolver = New-Object System.Windows.Forms.Button
$daReboot = New-Object System.Windows.Forms.Button
$daDiagnostics = New-Object System.Windows.Forms.Button

# Functions


#   GUI Textbox Out
$textBox.Location = '20,10'
$textBox.Size = '450,350'
$textBox.ReadOnly = $true

#   Button (L) DirectAccess Service Stop & Start
$daResolver.Text = 'Resolver'
$daResolver.Size = '140,23'
$daResolver.Location = '175,220'
$daResolver.Add_Click({
    
    Stop-Service iphlpsvc -Force
    Stop-Service NcaSvc

    Start-Sleep -Seconds 1

    Start-Service iphlpsvc
    Start-Service NcaSvc

    $textBox.Text = Write-Output "DirectAccess is now restarting..."
    Start-Sleep -Seconds 25
    Clear-Host

    $textBox.Text = Write-Output "DirectAccess is now RUNNING. You can now close this application."
})

#   Button (R) DirectAccess Service Stop & Start, IPV6 release and reboot
$daReboot.Size = '140,23'
$daReboot.Location = '330,220'
$daReboot.text = 'Resolver + Reboot'
$daReboot.Add_Click({

    Stop-Service iphlpsvc -Force
    Stop-Service NcaSvc

    Start-Sleep -Seconds 3

    Start-Service iphlpsvc
    Start-Service NcaSvc

    Start-Sleep -Seconds 3

    ipconfig.exe /release6
    ipconfig.exe /renew

    $textBox.Text = Write-Output "DirectAccess is now restarting and IPV6 being released..."
    Start-Sleep -Seconds 25
    Clear-Host

    $textBox.Text = Write-Output "Your machine will SHUTDOWN in 60 seconds. Please save all work."
    Stop-Computer -Force
})


$daDiagnostics.Text = 'Diagnostics'
$daDiagnostics.Size = '140,23'
$daDiagnostics.Location = '20,220'
$daDiagnostics.Add_Click({

})

#   Unrequired I/O 
#   $mainForm.AcceptButton = $okButton
#   $mainForm.CancelButton = $cancelButton

$mainForm.Text = 'Direct Access Resolver'
$mainForm.Size = "505,300" 


$mainForm.Controls.Add($textBox)
$mainForm.Controls.Add($daResolver)
$mainForm.Controls.Add($daReboot)
$mainForm.Controls.Add($daDiagnostics)


$mainForm.ShowDialog()


#   For implementing

#   Service-Status from TUI script
#   Speed test: "{0:N2} Mbit/sec" -f ((10/(Measure-Command {Invoke-WebRequest 'http://speed.transip.nl/10mb.bin' -UseBasicParsing|Out-Null}).TotalSeconds)*8)
#   Signal str: (netsh wlan show interfaces) -Match '^\s+Signal' -Replace '^\s+Signal\s+:\s+',''
#   Diagnostics button ^