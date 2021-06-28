#   James Wylde

#----------------------------------------------------------------------------------------#
#   Modules

Add-MailboxPermission "resource.to.access@email.com" -user "person.wanting.access@email.com" -AccessRights fullaccess -Confirm:$false

Add-RecipientPermission "shared.mailbox@email.com" -AccessRights SendAs -Trustee "person.wanting.access@email.com"