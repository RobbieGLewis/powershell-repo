#   James Wylde

cls

$computerName = Read-Host "Machine"
$taskName = Read-Host "Update"

Get-Service -Name winrm -ComputerName $computername | Set-Service -Status Running


$SoftwareDistributionPolicy = Get-WmiObject -Namespace "root\ccm\policy\machine\actualconfig" -Class "CCM_SoftwareDistribution" -ComputerName $computername | Where-Object { $_.PKG_Name -like $taskName } | Select-Object -Property PKG_Name, PKG_PackageID, ADV_AdvertisementID
$ScheduleID = Get-WmiObject -Namespace "root\ccm\scheduler" -Class "CCM_Scheduler_History" -ComputerName $computerName | Where-Object { $_.ScheduleID -like "*$($SoftwareDistributionPolicy.PKG_PackageID)*" } | Select-Object -ExpandProperty ScheduleID

$TaskSequencePolicy = Get-WmiObject -Namespace "root\ccm\policy\machine\actualconfig" -Class "CCM_TaskSequence" -ComputerName $computerName  | Where-Object { $_.ADV_AdvertisementID -like $SoftwareDistributionPolicy.ADV_AdvertisementID }
if ($TaskSequencePolicy.ADV_RepeatRunBehavior -notlike "RerunAlways") {
    $TaskSequencePolicy.ADV_RepeatRunBehavior = "RerunAlways"
    $TaskSequencePolicy.Put() | Out-Null
}

$TaskSequencePolicy.Get()
$TaskSequencePolicy.ADV_MandatoryAssignments = $true
$TaskSequencePolicy.Put() | Out-Null

Invoke-WmiMethod  -ComputerName $computername -Namespace "root\ccm" -Class "SMS_Client" -Name "TriggerSchedule" -ArgumentList $ScheduleID







####


cls

$computer = Read-Host "Machine name"


$TaskSequenceName = "Deploy COW10 - Production - Win10 20H2 Upgrade"
$SoftwareDistributionPolicy = Get-WmiObject -Namespace "root\ccm\policy\machine\actualconfig" -Class "CCM_SoftwareDistribution" -ComputerName $computer | Where-Object { $_.PKG_Name -like $TaskSequenceName } | Select-Object -Property PKG_Name, PKG_PackageID, ADV_AdvertisementID
$ScheduleID = Get-WmiObject -Namespace "root\ccm\scheduler" -Class "CCM_Scheduler_History" -ComputerName $computer | Where-Object { $_.ScheduleID -like "*$($SoftwareDistributionPolicy.PKG_PackageID)*" } | Select-Object -ExpandProperty ScheduleID

$TaskSequencePolicy = Get-WmiObject -Namespace "root\ccm\policy\machine\actualconfig" -Class "CCM_TaskSequence" -ComputerName $computer  | Where-Object { $_.ADV_AdvertisementID -like $SoftwareDistributionPolicy.ADV_AdvertisementID }
if ($TaskSequencePolicy.ADV_RepeatRunBehavior -notlike "RerunAlways") {
    $TaskSequencePolicy.ADV_RepeatRunBehavior = "RerunAlways"
    $TaskSequencePolicy.Put() | Out-Null
}

$TaskSequencePolicy.Get()
$TaskSequencePolicy.ADV_MandatoryAssignments = $true
$TaskSequencePolicy.Put() | Out-Null

Invoke-WmiMethod  -ComputerName $computer -Namespace "root\ccm" -Class "SMS_Client" -Name "TriggerSchedule" -ArgumentList $ScheduleID




#####


#----------------------------------------------------------------------------------------#

$ErrorActionPreference = 'SilentlyContinue'

#----------------------------------------------------------------------------------------#

CLS

Start-Transcript -Path c:\temp\SAP760progress.txt -Append

$computers = Get-Content -Path c:\temp\sapcomputers.txt
try{
    foreach ($computer in $computers) {
        if(!(Test-Connection $computer -Count 1 -Quiet)) {
            "$computer                                                                           Failure"
        }

        else{

            C:\windows\paexec.exe paexec.exe \\$computer  -s winrm.cmd quickconfig -q

            $TaskSequenceName = "Deploy COW10 - Production - Win10 20H2 Upgrade"
            $SoftwareDistributionPolicy = Get-WmiObject -Namespace "root\ccm\policy\machine\actualconfig" -Class "CCM_SoftwareDistribution" -ComputerName $computer | Where-Object { $_.PKG_Name -like $TaskSequenceName } | Select-Object -Property PKG_Name, PKG_PackageID, ADV_AdvertisementID
            $ScheduleID = Get-WmiObject -Namespace "root\ccm\scheduler" -Class "CCM_Scheduler_History" -ComputerName $computer | Where-Object { $_.ScheduleID -like "*$($SoftwareDistributionPolicy.PKG_PackageID)*" } | Select-Object -ExpandProperty ScheduleID
            
            $TaskSequencePolicy = Get-WmiObject -Namespace "root\ccm\policy\machine\actualconfig" -Class "CCM_TaskSequence" -ComputerName $computer  | Where-Object { $_.ADV_AdvertisementID -like $SoftwareDistributionPolicy.ADV_AdvertisementID }
            if ($TaskSequencePolicy.ADV_RepeatRunBehavior -notlike "RerunAlways") {
                $TaskSequencePolicy.ADV_RepeatRunBehavior = "RerunAlways"
                $TaskSequencePolicy.Put() | Out-Null
            }
            
            $TaskSequencePolicy.Get()
            $TaskSequencePolicy.ADV_MandatoryAssignments = $true
            $TaskSequencePolicy.Put() | Out-Null
            
            Invoke-WmiMethod  -ComputerName $computer -Namespace "root\ccm" -Class "SMS_Client" -Name "TriggerSchedule" -ArgumentList $ScheduleID
            

        }
    
}
}
catch{}