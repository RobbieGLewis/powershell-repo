cls

#$clientName = Read-Host "Machine name"
#$appName = Read-Host "Exact SCCM Package Name"
#$installSwitch = Read-Host "Install or Uninstall"



$computerName = Read-Host - "Machine"

Invoke-Command -ComputerName $computerName -ScriptBlock {

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


Trigger-AppInstallation -AppName "SAP Logon For Windows_x86_7.60_ML" -Method Install
Trigger-AppInstallation -AppName "Analysis for Office x64 2.4.3.69599" -Method Install

}