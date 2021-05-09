
$appName = 'SAP Logon For Windows_x86_7.60_ML'

$Application = (Get-CimInstance -ClassName CCM_Application -Namespace "root\ccm\clientSDK" -ComputerName $Computername | Where-Object {$_.Name -like $AppName})
 
$Args = @{EnforcePreference = [UINT32] 0
Id = "$($Application.id)"
IsMachineTarget = $Application.IsMachineTarget
IsRebootIfNeeded = $False
Priority = 'High'
Revision = "$($Application.Revision)" }


$computerName = Read-Host "Machine"

$Instance = @(Get-CimInstance -ClassName CCM_Application -Namespace "root\ccm\clientSDK" -ComputerName $Computername | Where-Object {$_.Name -like $AppName})
Invoke-CimMethod -Namespace ROOT\ccm\ClientSDK -ClassName CCM_Application -ComputerName $computerNAME -MethodName Install -Arguments $Args


#####


$computer = Get-Content -Path c:\temp\sapcomputers.txt
foreach ($computer in $computers) {
    Invoke-Command -ComputerName $using:computer -ScriptBlock {
        Trigger-AppInstallation -AppName "SAP Logon For Windows_x86_7.60_ML" -Method Install
        Start-Sleep -S 30
        Trigger-AppInstallation -AppName "Analysis for Office x64 2.4.3.69599" -Method Install
    }
}


