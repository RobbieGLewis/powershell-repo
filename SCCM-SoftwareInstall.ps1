cls

$clientName = Read-Host "Machine name"
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


#Trigger-AppInstallation -ComputerName $clientName -AppName "$appName" -Method $installSwitch

Trigger-AppInstallation -ComputerName $clientName -AppName "SAP Logon For Windows_x86_7.60_ML" -Method Install

Start-Sleep -S 5

Trigger-AppInstallation -ComputerName $clientName -AppName "Analysis for Office x64 2.4.3.69599" -Method Install





#Trigger-AppInstallation -ComputerName Uk-liv1-l27865 -AppName "NotepadPlusPlus_x64_7.9.3_ML" -Method Uninstall
#Trigger-AppInstallation -ComputerName PC01 -AppName "Acrobat Reader DC_x64_2021.001.20142_ML" -Method Uninstall
#Trigger-AppInstallation -ComputerName UK-TAN1-L018385 -AppName "Analysis for Office x64 2.4.3.69599" -Method Install



cls

$clientName = Read-Host "Machine name"
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


#Trigger-AppInstallation -ComputerName $clientName -AppName "$appName" -Method $installSwitch

Trigger-AppInstallation -ComputerName $clientName -AppName "SAP Logon For Windows_x86_7.60_ML" -Method Install

Start-Sleep -S 5

Trigger-AppInstallation -ComputerName $clientName -AppName "Analysis for Office x64 2.4.3.69599" -Method Install

