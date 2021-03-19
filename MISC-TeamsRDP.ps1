
$clientName = Read-Host 'Machine'
$userName = Read-Host 'User' 
psexec.exe \\$clientName cmd /C "net start winrm & netsh firewall set service type = remotedesktop mode = enable & reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f & reg.exe add "HKLM\Software\Microsoft\Windows NT\Current Version\AppCompatFlags\Layers" /v "C:\Users\$username\AppData\Local\Microsoft\Teams\current\teams.exe" /T REG_SZ /d "WIN7RTM" /F & reg.exe Add "HKLM\Software\Microsoft\Windows NT\Current Version\AppCompatFlags\Layers" /v "C:\ProgramData\$userName\Microsoft\Teams\Update.exe" /T REG_SZ /d "WIN7RTM" /F"






#paexec.exe \\PC01 -s c:\windows\system32\winrm.cmd quickconfig -quiet
