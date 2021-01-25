#   James Wylde 2020
#   github.com/jameswylde

#   Modules
Import-Module ActiveDirectory

#Get-ADUser -Properties * -Filter {Enabled -eq 'True'} | Where-Object {($_.memberof -like "_UK DSS ALL")} | Select-Object @{Label = "Email";Expression = {$_.EmailAddress}}, @{Label = "First Name";Expression = {$_.GivenName}}, @{Label = "Last Name";Expression = {$_.Surname}}, @{Label = "Group";Expression = {($_.canonicalname -Split "/")[-2]}} | Export-Csv -Path c:\temp\export2.csv -NoTypeInformation


Get-adgroupmember "ALL STAFF" | % {get-aduser $_ -properties emailaddress} | Select Name, SamAccountName, EMailaddress