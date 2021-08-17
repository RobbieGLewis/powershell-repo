#   James Wylde

#----------------------------------------------------------------------------------------#
#   Modules

Add-RecipientPermission "MeetingRoom@email.com" -trustee "person1@email.com" -AccessRights sendAs -Confirm:$false
Get-RecipientPermission "MeetingRoom@email.com"
Add-MailboxPermission "MeetingRoom@email.com" -user "person1@email.com" -AccessRights fullaccess -Confirm:$false


Get-RecipientPermission "person1@email.com"

#