Clear-Host

$ErrorActionPreference = 'silentlycontinue'

Write-Host "Enable RDP. Start Winrm. Create firewall exception. Apply Teams compatability regkeys."
Write-Host = "`r`n"

$clientName = Read-Host 'Machine'
$userName = Read-Host 'User' 

C:\temp\TeamsRDPfix\tools\paexec.exe \\$clientName cmd /C "net start winrm & netsh firewall set service type = remotedesktop mode = enable & netsh advfirewall firewall add rule name="Open Remote Desktop" protocol=TCP dir=in localport=3389 action=allow & reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f & reg.exe add "HKLM\Software\Microsoft\Windows NT\Current Version\AppCompatFlags\Layers" /v "C:\Users\$username\AppData\Local\Microsoft\Teams\current\teams.exe" /T REG_SZ /d "WIN7RTM" /F & reg.exe Add "HKLM\Software\Microsoft\Windows NT\Current Version\AppCompatFlags\Layers" /v "C:\ProgramData\$userName\Microsoft\Teams\Update.exe" /T REG_SZ /d "WIN7RTM" /F"
 
#psexec.exe \\$clientName cmd /C "net start winrm & netsh firewall set service type = remotedesktop mode = enable & netsh advfirewall firewall add rule name="Open Remote Desktop" protocol=TCP dir=in localport=3389 action=allow & reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f & reg.exe add "HKLM\Software\Microsoft\Windows NT\Current Version\AppCompatFlags\Layers" /v "C:\Users\$username\AppData\Local\Microsoft\Teams\current\teams.exe" /T REG_SZ /d "WIN7RTM" /F & reg.exe Add "HKLM\Software\Microsoft\Windows NT\Current Version\AppCompatFlags\Layers" /v "C:\ProgramData\$userName\Microsoft\Teams\Update.exe" /T REG_SZ /d "WIN7RTM" /F"

Write-Host = "`r`n"
Write-Host = "Finished and closing..." -ForegroundColor Blue -BackgroundColor green

Set-Location C:\temp\TeamsRDPfix

Start-Sleep -Seconds 10

#paexec.exe \\PC01 -s c:\windows\system32\winrm.cmd quickconfig -quiet


./paexec.exe \\$clientName reg.exe Add "HKLM\Software\Microsoft\Windows NT\Current Version\AppCompatFlags\Layers" /v "C:\ProgramData\$userName\Microsoft\Teams\Update.exe" /T REG_SZ /d "WIN7RTM" /F