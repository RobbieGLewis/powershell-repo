#   James Wylde

#----------------------------------------------------------------------------------------#
#   Modules
Import-Module ActiveDirectory

$computers = Get-Content c:\temp\computers.csv

foreach ($computer in $computers) { 
    $compAdd = Get-ADComputer $computer
    Add-ADGroupMember -ID GBR-SD-SCCM-CAS002E3-MA -Members $compAdd -PassThru

}

#----------------------------------------------------------------------------------------#

Import-Module ActiveDirectory

$users = Get-ADuser c:\temp\visionusers.txt
$destinationGroup = "GBR-UK-HUB-U-Vision_Users"

$startCount = (Get-ADGroupMember -Identity $destinationGroup).Count
$newMembersCount = $users.Count

foreach ($user in $users) { 
    $userAdd = Get-ADUser $user
    Add-ADGroupMember -ID $destinationGroup -Members $userAdd -PassThru

}

$endCount = (Get-ADGroupMember -Identity $destinationGroup).Count

$newCount = $endCount - $startCount

Write-Host - "$newMembersCount users have been added to group $destinationGroup" -ForegroundColor White -BackgroundColor Green
Write-Host - "$newCount NET TOTAL + $destinationGroup" -ForegroundColor White -BackgroundColor Green

#Remove-ADGroupMember