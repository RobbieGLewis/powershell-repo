#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules

$Path = Get-ChildItem -Path C:\Windows\CCMCache -Recurse -Filter UKP_8x8_8x8VirtualOffice_x64_EN_7.1.5-1.msi

ForEach ( $Search in $Path) {

    Start-Process -Wait -FilePath $Search.FullName -ArgumentList " $($Search.FullName) /q -Wait -NoNewWindow" 

}



####


$Path = Get-ChildItem -Path C:\Windows\CCMCache -Recurse -Filter UKP_8x8_8x8VirtualOffice_x64_EN_7.1.5-1.msi

ForEach ( $Search in $Path) {

    Start-Process msiexec.exe -Wait -FilePath $Search.FullName -ArgumentList "/I $($Search.FullName) /q -Wait -NoNewWindow" 

}


####

$computerName = Read-Host "PC to install 8x8 latest"
Invoke-Command -ComputerName $computerName -ScriptBlock {
foreach ($_msi8x8 in 
($_msi8x8 = Get-ChildItem C:\windows\ccmcache -Recurse | Where-Object {$_.Name -eq "UKP_8x8_8x8VirtualOffice_x64_EN_7.1.5-1.msi"} |
Where-Object {!$_psiscontainter} | Select-Object -ExpandProperty FullName))
{
       (Start-process msiexec.exe -ArgumentList "/i $_msi8x8 /quiet /norestart" -Wait -PassThru).ExitCode
}
}
