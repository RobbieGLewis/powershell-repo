
#Query

Get-mailboxfolderpermission -Identity james.wylde@smurfitkappa.co.uk:\Calendar -User matt.davies@smurfitkappa.co.uk

Add-MailboxfolderPermission -Identity james.wylde@smurfitkappa.co.uk:\Calendar -User matt.davies@smurfitkappa.co.uk -AccessRights Reviewer -SendNotificationToUser $true

Remove-MailboxfolderPermission -Identity james.wylde@smurfitkappa.co.uk:\Calendar -User matt.davies@smurfitkappa.co.uk -AccessRights Reviewer

#Status only

Add-MailboxfolderPermission -Identity james.wylde@smurfitkappa.co.uk:\Calendar -User matt.davies@smurfitkappa.co.uk -AccessRights AvailabilityOnly -SendNotificationToUser $true


