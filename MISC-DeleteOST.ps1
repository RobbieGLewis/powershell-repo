#   James Wylde 2019
#   github.com/jameswylde

# Modules


Invoke-Command -ComputerName PC01 -Scriptblock {

Stop-Process -Name outlook -Force

Move-Item -Path "%LOCALAPPDATA%\Microsoft\Outlook*.*" -Destination '%UserProfile%\Documents' -Force

Remove-Item -Path "%LOCALAPPDATA%\Microsoft\Outlook*.*"

Start-Process -Name outlook

}
