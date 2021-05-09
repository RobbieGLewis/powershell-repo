
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

    $appName = 'SAP Logon For Windows_x86_7.60_ML'

    $Application = (Get-CimInstance -ClassName CCM_Application -Namespace "root\ccm\clientSDK" -ComputerName $Computername | Where-Object {$_.Name -like $AppName})
 
    $Args = @{EnforcePreference = [UINT32] 0
    Id = "$($Application.id)"
    IsMachineTarget = $Application.IsMachineTarget
    IsRebootIfNeeded = $False
    Priority = 'High'
    Revision = "$($Application.Revision)" }

    $Instance = @(Get-CimInstance -ClassName CCM_Application -Namespace "root\ccm\clientSDK" -ComputerName $Computername | Where-Object {$_.Name -like $AppName})
    Invoke-CimMethod -Namespace ROOT\ccm\ClientSDK -ClassName CCM_Application -ComputerName $computerNAME -MethodName Install -Arguments $Args


    }
}




####


$computerName = Get-Content C:\temp\sapcomputers.txt

$appName = 'SAP Logon For Windows_x86_7.60_ML'

$Application = (Get-CimInstance -ClassName CCM_Application -Namespace "root\ccm\clientSDK" -ComputerName $Computername | Where-Object {$_.Name -like $AppName})

$Args = @{EnforcePreference = [UINT32] 0
Id = "$($Application.id)"
IsMachineTarget = $Application.IsMachineTarget
IsRebootIfNeeded = $False
Priority = 'High'
Revision = "$($Application.Revision)" }

$Instance = @(Get-CimInstance -ClassName CCM_Application -Namespace "root\ccm\clientSDK" -ComputerName $Computername | Where-Object {$_.Name -like $AppName})
Invoke-CimMethod -Namespace ROOT\ccm\ClientSDK -ClassName CCM_Application -ComputerName $computerNAME -MethodName Install -Arguments $Args | ft -AutoSize

####

#$cred = Get-Credential

CLS

$computer = Get-Content -Path c:\temp\sapcomputers.txt
$script = @($appName = 'SAP Logon For Windows_x86_7.60_ML'

$Args = @{EnforcePreference = [UINT32] 0
Id = "$($Application.id)"
IsMachineTarget = $Application.IsMachineTarget
IsRebootIfNeeded = $False
Priority = 'High'
Revision = "$($Application.Revision)" }

$Application = (Get-CimInstance -ClassName CCM_Application -Namespace "root\ccm\clientSDK" -ComputerName $computer | Where-Object {$_.Name -like $AppName})

$Instance = @(Get-CimInstance -ClassName CCM_Application -Namespace "root\ccm\clientSDK" -ComputerName $Computer | Where-Object {$_.Name -like $AppName})
Invoke-CimMethod -Namespace ROOT\ccm\ClientSDK -ClassName CCM_Application -ComputerName $computer -MethodName Install -Arguments $Args | ft -AutoSize


)

Invoke-Command -ComputerName $computer -ScriptBlock {
   
        echo "$using:script"
    
}


### WORKING WMI

$cred = Get-Credential

CLS

$computer = Get-Content -Path c:\temp\sapcomputers.txt


Invoke-Command -ComputerName $computer -ScriptBlock {
   
$i = Get-WmiObject -Class CCM_Program -Namespace "root\ccm\clientsdk" | Where-Object { $_.Name -like "SAP Logon For Windows_x86_7.60_ML" }    
Invoke-WmiMethod -class CCM_ProgramsManager -Namespace "root\ccm\clientsdk" -Name ExecutePrograms -argumentlist $i -Credential $cred

    
}

