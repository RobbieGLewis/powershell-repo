Clear-Host

$computerName = Read-Host "Machine"
$userName = Read-Host "Username"


###### Winrm start
Write-Host "Starting Winrm...." -ForegroundColor Green 

Get-Service -Name winrm -ComputerName $computername | Set-Service -Status Running

###### End processes

Write-Host "Stopping programs...." -ForegroundColor Green 

Stop-Process -Name Teams -Force

Stop-Process -Name Outlook -Force

Stop-Process -Name Skype -Force


###### Clear credmanager

Write-Host "Clearing credman...." -ForegroundColor Green 

or /F "tokens=1,2 delims= " %G in ('cmdkey /list ^| findstr Target') do cmdkey /delete %H

###### Chrome

Write-Host "Clearing Chrome...." -ForegroundColor Green 

Remove-Item -path "C:\Users\$userName\AppData\Local\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -EA SilentlyContinue -Verbose
Remove-Item -path "C:\Users\$userName\AppData\Local\Google\Chrome\User Data\Default\Cache2\entries\*" -Recurse -Force -EA SilentlyContinue -Verbose
Remove-Item -path "C:\Users\$userName\AppData\Local\Google\Chrome\User Data\Default\Cookies" -Force -EA SilentlyContinue -Verbose
Remove-Item -path "C:\Users\$userName\AppData\Local\Google\Chrome\User Data\Default\Media Cache" -Force -EA SilentlyContinue -Verbose
Remove-Item -path "C:\Users\$userName\AppData\Local\Google\Chrome\User Data\Default\Cookies-Journal" -Force -EA SilentlyContinue -Verbose


###### IE

Write-Host "Clearing IE...." -ForegroundColor Green 

Remove-Item -path "C:\Users\$userName\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" -Recurse -Force -EA SilentlyContinue -Verbose
Remove-Item -path "C:\Users\$userName\AppData\Local\Microsoft\Windows\WER\*" -Recurse -Force -EA SilentlyContinue -Verbose


###### Regkeys

Write-Host "Clearing regkeys" -ForegroundColor Green 

Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Internet Explorer" -Name "IntelliForms"


###### Windows Temp

Write-Host "Clearing Temp" -ForegroundColor Green 

Remove-Item -path "C:\Windows\Temp\*" -Recurse -Force -EA SilentlyContinue -Verbose

###### Teams

Write-Host "Clearing Teams" -ForegroundColor Green 

Remove-Item -Path "%AppData%\Microsoft\teams\cache\*" -Recurse -Force -EA SilentlyContinue -Verbose
Remove-Item -Path "%AppData%\Microsoft\teams\gpucache\*" -Recurse -Force -EA SilentlyContinue -Verbose


###### Skype

Write-Host "Clearing Skype" -ForegroundColor Green 

Remove-Item -Path "%LOCALAPPDATA%\Microsoft\Office\16.0\Lync\*" -Recurse -Force -EA SilentlyContinue -Verbose