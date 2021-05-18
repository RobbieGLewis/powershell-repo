#   James Wylde

#----------------------------------------------------------------------------------------#
#   Modules
Import-Module ActiveDirectory

Get-ADUser -Filter {description -eq 'General Manager' -and country -eq 'GB'} -Properties description, country | Select-Object name, samaccountname, country | ft -AutoSize

Get-ADUser -Filter {description -eq 'Financial Controller' -and country -eq 'GB'} -Properties description, country | Select-Object name, samaccountname, country | ft -AutoSize