#   James Wylde

#----------------------------------------------------------------------------------------#
#   Modules

Add-MailboxPermission "resource.to.access@email.com" -user "person.wanting.access@email.com" -AccessRights fullaccess -Confirm:$false

Add-RecipientPermission "orders.weston@smurfitkappa.co.uk" -AccessRights SendAs -Trustee "person.wanting.access@email.com"