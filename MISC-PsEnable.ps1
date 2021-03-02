#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules

#   Standard
Enable-PSRemoting -Force
Start-Service winrm

#   Unidentified network
Set-NetConnectionProfile -NetworkCategory Private

#   In a pinch
Stop-Service winrm
Enable-PSRemoting -SkipNetworkProfileCheck -Force
Start-EditorServices winrm