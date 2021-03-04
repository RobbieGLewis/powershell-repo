#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules

Add-MailboxPermission "resource.to.access@email.com" -user "person.wanting.access@email.com" -AccessRights fullaccess -Confirm:$false