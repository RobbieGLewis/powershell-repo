#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules

$Path = Get-ChildItem -Path C:\Windows\CCMCache -Recurse -Filter setup.exe

ForEach ( $Search in $Path) {

    Start-Process -Wait -FilePath $Search.FullName -ArgumentList " $($Search.FullName) /q -Wait -NoNewWindow" 

}