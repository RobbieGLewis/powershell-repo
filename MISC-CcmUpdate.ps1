#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules

$Path = Get-ChildItem -Path C:\Windows\CCMCache -Recurse -Filter setup.exe

ForEach ( $Installer in $Path) {

    Start-Process -Wait -FilePath $Installer.FullName -ArgumentList " $($Installer.FullName) /q -Wait -NoNewWindow" 

}