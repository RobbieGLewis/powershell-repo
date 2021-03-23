$count = 9
do {
    Write-Host $count -ForegroundColor yellow -BackgroundColor red
    Sleep 1
    $count--
} while ($count -gt 0)





netsh advfirewall monitor show consec verbose > c:\temp\output.txt
netsh advfirewall monitor show currentprofile
netsh advfirewall set allprofiles state off

netsh firewall set opmode mode=DISABLE

netsh interface set interface "Ethernet" disabled




PAEXEC EACH MACHINE IN WHATEVER
EXECUTE : netsh advfirewall firewall add rule dir=in name ="WMI" program=%systemroot%\system32\svchost.exe service=winmgmt action = allow protocol=TCP localport=any


netsh advfirewall firewall add rule dir=in name=”RPC” action = allow protocol=tcp localport=135

netsh advfirewall firewall add rule dir=in name="SMB" action = allow protocol=tcp localport=445


netsh advfirewall firewall add rule name=”SMB” dir=in action=allow protocol=tcp localport=445

netsh int ipv4 set dynamicport tcp start=1024 num=5000
netsh int ipv4 set dynamicport tcp start=49152 num=65535
netsh int ipv4 show dynamicport tcp #verify





Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters\NegativeCachePeriod    created and changed to 0
NLASVc - automatic delayed restart resolved
Toggled on/off DNS on adapter
Flushed and registered DNS

TCP SMB 445, all services and programs

Remote Event Log Management (NP-in)

TCP RPC dynamic ports, EventLog (Windows Event Log service)

Remote Event Log Management (RPC)

TCP port 135, RPCSS (Remote Procedure Call service)

Remote Event Log Management (RPC-EPMAP)

TCP all ports, Winmgmt (Windows Management Instru

netsh advfirewall firewall add rule name="GPUPDATE" protocol=TCP dir=in localport=445 action=allow
netsh advfirewall firewall add rule name="GPUPDATE" protocol=TCP dir=in localport=135 action=allow
netsh advfirewall set service remoteadmin

Invoke-GPUpdate configuration Name {
    # One can evaluate expressions to get the node list
    # E.g: $AllNodes.Where("Role -eq Web").NodeName
    node ("Node1","Node2","Node3")
    {
        # Call Resource Provider
        # E.g: WindowsFeature, File
        WindowsFeature FriendlyName
        {
            Ensure = "Present"
            Name = "Feature Name"
        }

        File FriendlyName
        {
            Ensure = "Present"
            SourcePath = $SourcePath
            DestinationPath = $DestinationPath
            Type = "Directory"
            DependsOn = "[WindowsFeature]FriendlyName"
        }
    }
}

call netsh firewall set service RemoteAdmin enable

OPEN WMI





Execute:
da group

netsh advfirewall firewall add rule dir=in name ="WMI" program=%systemroot%\system32\svchost.exe service=winmgmt action = allow protocol=TCP localport=any
call netsh firewall set service RemoteAdmin enable
netsh firewall add portopening protocol=tcp port=135 name=DCOM_TCP135

Then

GPUPDATE


#(Get-AdComputer -Filter *).Name | Out-File computers.txt
psexec @computers.txt cmd /C "netsh advfirewall firewall add rule dir=in name ="WMI" program=%systemroot%\system32\svchost.exe service=winmgmt action = allow protocol=TCP localport=any & call netsh firewall set service RemoteAdmin enable & netsh firewall add portopening protocol=tcp port=135 name=DCOM_TCP135" | Out-file -Path c:\temp\gpupdates.txt


$computers = Get-Content -Path c:\temp\computers1.txt
If (-not (Test-Connection -ComputerName $computers -Count 1 -Quiet))
{
'No such computer or computer is offline','Connection Error','OK','Error'
}
Else
{ paexec.exe @$computers cmd /C "netsh advfirewall firewall add rule dir=in name ="WMI" program=%systemroot%\system32\svchost.exe service=winmgmt action = allow protocol=TCP localport=any & call netsh firewall set service RemoteAdmin enable & netsh firewall add portopening protocol=tcp port=135 name=DCOM_TCP135" | Out-file -Path c:\temp\gpupdates.txt }



$computers = (Get-Adgroupmember -Identity "GBR-WS-DirectAccess").Name | Out-File computers.txt
If (-not (Test-Connection -ComputerName $computers -Count 1 -Quiet))
{
'No such computer or computer is offline','Connection Error','OK','Error'
}
Else
{ paexec.exe @computers.txt hostname cmd /C "netsh advfirewall firewall add rule dir=in name ="WMI" program=%systemroot%\system32\svchost.exe service=winmgmt action = allow protocol=TCP localport=any & call netsh firewall set service RemoteAdmin enable & netsh firewall add portopening protocol=tcp port=135 name=DCOM_TCP135" | Out-File -FilePath C:\temp\gpresults.txt }





$computers = Get-Content -Path c:\temp\computers1.txt
If (-not (Test-Connection $computers -Count 1 -Quiet))
{
'No such computer or computer is offline','Connection Error','OK','Error'
}
Else
{ psexec.exe @c:\temp\computers1.txt hostname cmd /C "netsh advfirewall firewall add rule dir=in name ="WMI" program=%systemroot%\system32\svchost.exe service=winmgmt action = allow protocol=TCP localport=any & call netsh firewall set service RemoteAdmin enable & netsh firewall add portopening protocol=tcp port=135 name=DCOM_TCP135" | Out-File -FilePath C:\temp\gpresults.txt }



$clientName = Get-Content c:\temp\computers.txt

C:\temp\temp\tools\paexec.exe \\$clientName cmd /C "netsh advfirewall firewall add rule dir=in name ="WMI" program=%systemroot%\system32\svchost.exe service=winmgmt action = allow protocol=TCP localport=any & call netsh firewall set service RemoteAdmin enable & netsh firewall add portopening protocol=tcp port=135 name=DCOM_TCP135" | Out-File -FilePath C:\Temp\gpresult.txt

#Get-Content -Path C:\temp\TeamsRDPfix\result.txt





foreach($computer in Get-Content -Path c:\temp\computers.txt){
    if(-not (Test-Connection $computers -Count 1 -Quiet)) {
        "Computer '$computer' is offline"
    }
    else {
        C:\temp\temp\tools\paexec.exe \\$computer cmd /C "netsh advfirewall firewall add rule dir=in name ="WMI" program=%systemroot%\system32\svchost.exe service=winmgmt action = allow protocol=TCP localport=any & call netsh firewall set service RemoteAdmin enable & netsh firewall add portopening protocol=tcp port=135 name=DCOM_TCP135" | Out-File -FilePath C:\Temp\gpresult.txt -Append
        }

}

#############################################################


cls

Start-Transcript -Path "c:\temp\gpupdates.txt" -NoClobber
#$testconnection = Test-Connection $computers
foreach($computer in Get-Content -Path c:\temp\computers1.txt){
    if(-not (Test-Connection $computer -Count 1 -Quiet)) {
       "$computer is offline"
    }
    else {
        C:\temp\temp\tools\paexec.exe \\$computer cmd /C "netsh advfirewall firewall add rule dir=in name ="WMI" program=%systemroot%\system32\svchost.exe service=winmgmt action = allow protocol=TCP localport=any & call netsh firewall set service RemoteAdmin enable & netsh firewall add portopening protocol=tcp port=135 name=DCOM_TCP135" | Out-File -FilePath C:\Temp\gpresult.txt -Append
        }

}

# | Out-File -FilePath C:\Temp\gpresult.txt -Append