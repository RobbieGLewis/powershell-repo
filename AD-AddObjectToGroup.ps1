#   James Wylde

#----------------------------------------------------------------------------------------#
#   Modules
Import-Module ActiveDirectory

$computers = Get-Content c:\temp\computers.csv

foreach ($computer in $computers) { 
    $compAdd = Get-ADComputer $computer
    Add-ADGroupMember -ID GBR-SD-SCCM-CAS002E3-MA -Members $compAdd -PassThru

}



Import-Module ActiveDirectory

$users = Get-ADuser c:\temp\visionusers.txt

foreach ($user in $users) { 
    $userAdd = Get-ADUser $user
    Add-ADGroupMember -ID "GBR-UK-HUB-U-Vision_Users" -Members $userAdd -PassThru

}

#Remove-ADGroupMember