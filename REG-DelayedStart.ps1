#   James Wylde

Clear-Host

$ErrorActionPreference = 'silentlycontinue'

Write-Host "`r`n"
Write-Host "Enable RDP. Start Winrm. Create firewall exception. Apply Teams compatability regkeys."
Write-Host "`r`n"


$clientName = Read-Host 'Machine'

C:\temp\TeamsRDPfix\tools\paexec.exe \\$clientName cmd /C "reg.exe Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NlaSvc" /v DelayedAutoStart /T REG_SZ /d 1 /F & 


reg.exe Add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NlaSvc" /v Start /T REG_SZ /d 2 /F"




reg.exe Add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3" /v Settings /T REG_BINARY /d '30 00 00 00 fe ff ff ff 03 02 00 00 03 00 00 00 3e 00 00 00 28 00 00 00 00 00 00 00 5c 03 00 00 a0 05 00 00 84 03 00 00 60 00 00 00 01 00 00 00' /f


reg Add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3" /v Settings /T REG_BINARY /d "30 00 00 00 fe ff ff ff 03 02 00 00 03 00 00 00 3e 00 00 00 28 00 00 00 00 00 00 00 5c 03 00 00 a0 05 00 00 84 03 00 00 60 00 00 00 01 00 00 00" /f




'30,00,00,00,fe,ff,ff,ff,02,20,00,00,03,00,00,00,3e,00,00,00,28,\,00,00,00,00,00,00,00,10,04,00,00,80,07,00,00,38,04,00,00,60,00,00,00,01,00,\,00,00'


reg Add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3" /v Settings /T REG_BINARY /d "hex:30 00 00 00 fe ff ff ff 02 20 00 00 03 00 00 00 3e 00 00 00 28 00 00 00 00 00 00 00 10 04 00 00 80 07 00 00 38 04 00 00 60 00 00 00 01 00 00 00" /f

powershell.exe -command "$RegValues = (Get-ItemProperty -Path "dir HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3").Settings | Set-ItemProperty -Path "dir HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3" -Name -Value 3"