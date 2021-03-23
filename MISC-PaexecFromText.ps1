#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules


Clear-Host

Start-Transcript -Path "c:\temp\gpupdates.txt" -NoClobber
foreach($computer in Get-Content -Path c:\temp\computers1.txt){
    if(!(Test-Connection $computer -Count 1 -Quiet)) {
       "$computer is offline"
    }
    else {
        C:\temp\temp\tools\paexec.exe \\$computer cmd /C "netsh advfirewall firewall add rule dir=in name ="WMI" program=%systemroot%\system32\svchost.exe service=winmgmt action = allow protocol=TCP localport=any & call netsh firewall set service RemoteAdmin enable & netsh firewall add portopening protocol=tcp port=135 name=DCOM_TCP135"
        }

}