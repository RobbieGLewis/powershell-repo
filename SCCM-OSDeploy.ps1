cls

$computername = Read-Host "Machine name"


$TaskSequenceName = "Deploy COW10 - Production - Win10 20H2 Upgrade"
$SoftwareDistributionPolicy = Get-WmiObject -Namespace "root\ccm\policy\machine\actualconfig" -Class "CCM_SoftwareDistribution" -ComputerName $computername | Where-Object { $_.PKG_Name -like $TaskSequenceName } | Select-Object -Property PKG_Name, PKG_PackageID, ADV_AdvertisementID
$ScheduleID = Get-WmiObject -Namespace "root\ccm\scheduler" -Class "CCM_Scheduler_History" -ComputerName $computername | Where-Object { $_.ScheduleID -like "*$($SoftwareDistributionPolicy.PKG_PackageID)*" } | Select-Object -ExpandProperty ScheduleID

$TaskSequencePolicy = Get-WmiObject -Namespace "root\ccm\policy\machine\actualconfig" -Class "CCM_TaskSequence" -ComputerName $computername  | Where-Object { $_.ADV_AdvertisementID -like $SoftwareDistributionPolicy.ADV_AdvertisementID }
if ($TaskSequencePolicy.ADV_RepeatRunBehavior -notlike "RerunAlways") {
    $TaskSequencePolicy.ADV_RepeatRunBehavior = "RerunAlways"
    $TaskSequencePolicy.Put() | Out-Null
}

$TaskSequencePolicy.Get()
$TaskSequencePolicy.ADV_MandatoryAssignments = $true
$TaskSequencePolicy.Put() | Out-Null

Invoke-WmiMethod  -ComputerName $computername -Namespace "root\ccm" -Class "SMS_Client" -Name "TriggerSchedule" -ArgumentList $ScheduleID