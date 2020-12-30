#   James Wylde 2019
#   ferus-wylde@github

# Modules
Import-Module ActiveDirectory

$User = Read-Host -Prompt "User"

#Get-ADUser -Filter "SamAccountName -like '*$User*' -OR Name -like '*$User*'"

$Pass = Read-Host -Prompt "Password"

Set-ADAccountPassword -Identity $User -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "$Pass" -Force)