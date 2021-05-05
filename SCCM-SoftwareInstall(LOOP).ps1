cls

#$clientName = Read-Host "Machine name"
#$appName = Read-Host "Exact SCCM Package Name"
#$installSwitch = Read-Host "Install or Uninstall"


Function Trigger-AppInstallation
{
 
Param
(
 [String][Parameter(Mandatory=$True, Position=1)] $Computername,
 [String][Parameter(Mandatory=$True, Position=2)] $AppName,
 [ValidateSet("Install","Uninstall")]
 [String][Parameter(Mandatory=$True, Position=3)] $Method
)
 
Begin {
$Application = (Get-CimInstance -ClassName CCM_Application -Namespace "root\ccm\clientSDK" -ComputerName $Computername | Where-Object {$_.Name -like $AppName})
 
$Args = @{EnforcePreference = [UINT32] 0
Id = "$($Application.id)"
IsMachineTarget = $Application.IsMachineTarget
IsRebootIfNeeded = $False
Priority = 'High'
Revision = "$($Application.Revision)" }
 
}
 
Process
 
{
 
Invoke-CimMethod -Namespace "root\ccm\clientSDK" -ClassName CCM_Application -ComputerName $Computername -MethodName $Method -Arguments $Args
 
}
 
End {}
 
}

$computer = Get-Content -Path c:\temp\sapcomputers.txt
foreach ($computer in $computers) {
    Invoke-Command -ComputerName $using:computer -ScriptBlock {
        Trigger-AppInstallation -AppName "SAP Logon For Windows_x86_7.60_ML" -Method Install
        Start-Sleep -S 30
        Trigger-AppInstallation -AppName "Analysis for Office x64 2.4.3.69599" -Method Install
    }
}


