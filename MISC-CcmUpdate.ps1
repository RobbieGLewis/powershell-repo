#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules

$Path = Get-ChildItem -Path C:\Windows\CCMCache -Recurse -Filter setup1.exe

ForEach ( $Installer in ( Get-ChildItem -Path $Path.DirectoryName -Filter *.exe) ) {

Start-Process -Wait -FilePath setup1.exe -ArgumentList "/i $($Installer.FullName)"
}