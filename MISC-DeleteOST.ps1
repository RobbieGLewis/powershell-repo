#   James Wylde 2019
#   github.com/jameswylde

#   Modules
#.
#   Notes
#   Created for large number of users experiencing 'Unable to launch Outlook' - much faster than remoting on, creating new profile, booting into Outlook SM etc. 
#   Closes Outlook, creates backup of current .OST in their Documents, and re-opens Outlook forcing user to create new profile and having new .OST generate


Invoke-Command -ComputerName PC01 -Scriptblock {

Stop-Process -Name outlook -Force

Move-Item -Path "$env:User\AppData\Local\Microsoft\Outlook*.*" -Destination '%UserProfile%\Documents' -Force

Remove-Item -Path "%LOCALAPPDATA%\Microsoft\Outlook*.*"

Start-Process -Name outlook

}
