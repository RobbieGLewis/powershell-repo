#   James Wylde

#----------------------------------------------------------------------------------------#
#   Modules
Import-Module ActiveDirectory

Get-ADUser -Filter {description -eq 'General Manager' -and country -eq 'GB'} -Properties description, country | Select-Object name, samaccountname, email, country | ft -AutoSize