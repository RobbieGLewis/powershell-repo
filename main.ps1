
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null

$mainForm = New-Object System.Windows.Forms.Form
$textBox = New-Object System.Windows.Forms.TextBox
$daResolver = New-Object System.Windows.Forms.Button
$daReboot = New-Object System.Windows.Forms.Button

#   GUI Textbox Out
$textBox.Location = '23,10'
$textBox.Size = '450,350'
$textBox.ReadOnly = $true

#   Button (L) DirectAccess Service Stop & Start
$daResolver.Text = 'DirectAccess Resolver'
$daResolver.Size = '175,23'
$daResolver.Location = '56,220'
$daResolver.Add_Click({

    Stop-Service iphlpsvc -Force
    Stop-Service NcaSvc

    Start-Sleep -Seconds 1

    Start-Service iphlpsvc
    Start-Service NcaSvc
})

#   Button (R) DirectAccess Service Stop & Start, IPV6 release and reboot
$daReboot.Size = '175,23'
$daReboot.Location = '250,220'
$daReboot.text = 'DirectAccess Resolver + Reboot'
$daReboot.Add_Click({

    Stop-Service iphlpsvc -Force
    Stop-Service NcaSvc

    Start-Sleep -Seconds 2

    Start-Service iphlpsvc
    Start-Service NcaSvc

    Start-Sleep -Seconds 2

    ipconfig.exe /release6
    ipconfig.exe /renew

    Stop-Computer -Confirm
})


#   Unrequired I/O 
#   $mainForm.AcceptButton = $okButton
#   $mainForm.CancelButton = $cancelButton

$mainForm.Text = 'Direct Access Resolver'
$mainForm.Size = "500,300" 


$mainForm.Controls.Add($textBox)
$mainForm.Controls.Add($daResolver)
$mainForm.Controls.Add($daReboot)


$mainForm.ShowDialog()


#   For implementing

#   Service-Status from TUI script
#   Speed test: "{0:N2} Mbit/sec" -f ((10/(Measure-Command {Invoke-WebRequest 'http://speed.transip.nl/10mb.bin' -UseBasicParsing|Out-Null}).TotalSeconds)*8)
#   Signal str: (netsh wlan show interfaces) -Match '^\s+Signal' -Replace '^\s+Signal\s+:\s+',''
#   Diagnostics button ^