#   James Wylde

#----------------------------------------------------------------------------------------#
#   Modules
Import-Module ActiveDirectory

# Enabled
#Get-ADUser -Properties * -Filter {Enabled -eq 'True'} | Where-Object {($_.memberof -like "_UK DSS ALL")} | Select-Object @{Label = "Email";Expression = {$_.EmailAddress}}, @{Label = "First Name";Expression = {$_.GivenName}}, @{Label = "Last Name";Expression = {$_.Surname}}, @{Label = "Group";Expression = {($_.canonicalname -Split "/")[-2]}} | Export-Csv -Path c:\temp\export2.csv -NoTypeInformation

# Get-ADGroupMember -identity "_UK DSS All Users" | select name | Export-Csv -path C:\temp\export.csv


Get-ADGroupMember "_UK DSS All Users" | ForEach-Object  {get-aduser $_ -properties emailaddress} | Select-Object Name, SamAccountName, EMailaddress | Export-Csv -path C:\temp\export2.csv


Get-ADGroupMember "GBR-WS-DirectAccess" | Select-Object name | Export-Csv -path C:\temp\export2.csv