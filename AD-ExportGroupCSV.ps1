#   James Wylde 2020
#   github.com/jameswylde

#   Modules
Import-Module ActiveDirectory

$groupMembers = Get-ADGroupMember GroupName
foreach($member in $groupMembers){
    $user = Get-ADUser $member -Properties mail
    $emailAddress = $user.Mail
    Export-Csv $emailAddress
}