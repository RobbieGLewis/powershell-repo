#   James Wylde

#----------------------------------------------------------------------------------------#
#   Modules

#Query
Get-mailboxfolderpermission -Identity person1@email.com:\Calendar -User person2@email.com

Add-MailboxfolderPermission -Identity person1@email.comk:\Calendar -User person2@email.com -AccessRights Reviewer -SendNotificationToUser $true

Remove-MailboxfolderPermission -Identity person1@email.com:\Calendar -User person2@email.com -AccessRights Reviewer

#Status only
Add-MailboxfolderPermission -Identity person1@email.comk:\Calendar -User person2@email.com -AccessRights AvailabilityOnly -SendNotificationToUser $true


