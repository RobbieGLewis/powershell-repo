#   James Wylde

#----------------------------------------------------------------------------------------#
#   Modules
Import-Module ActiveDirectory

Get-ADUser -Filter {description -eq 'general manager' -or country -eq 'united kingdom'}