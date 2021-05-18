#   James Wylde

#----------------------------------------------------------------------------------------#
#   Modules
Import-Module ActiveDirectory

$computers = Get-Content c:\temp\computers.csv

foreach ($computer in $computers) { 
    $compAdd = Get-ADComputer $computer
    Add-ADGroupMember -ID GBR-SD-SCCM-CAS002E3-MA -Members $compAdd -PassThru

}


#Remove-ADGroupMember