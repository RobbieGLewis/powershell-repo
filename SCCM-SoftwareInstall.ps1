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

#Trigger-AppInstallation -ComputerName PC01 -AppName "NotepadPlusPlus_x64_7.9.3_ML" -Method Install
Trigger-AppInstallation -ComputerName UK-LIV1-L29545 -AppName "Acrobat Reader DC_x64_2021.001.20142_ML" -Method install
#Trigger-AppInstallation -ComputerName uk-cor4-l022090 -AppName "8x8 Virtual Office_x64_7.1.5.1" -Method Install