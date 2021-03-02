Get-Mailbox "tannochside.estimating@smurfitkappa.co.uk" 
Get-Mailbox "Diss.ShiftManagers@smurfitkappa.co.uk"
Get-migrationendpoint | format-list identity, remoteserver

New-moverequest -identity "Diss.Shiftmanagers@smurfitkappa.co.uk" -Remote -RemoteHostName "xx" -TargetDeliveryDomain "group.mail.onmicrosoft.com" -RemoteCredential (Get-Credential group\a1-wyldeja)
Get-Moverequest -identity "Diss.Shiftmanagers@smurfitkappa.co.uk" | Get-moverequeststatistics
Get-moverequeststatistics -identity "Diss.Shiftmanagers@smurfitkappa.co.uk"

Set-Mailbox "phil.webb" -EmailAddress "SMTP:a@b.com"

Set-Mailbox "phil.webb" -PrimarySMTPAddress "SMTP:a@b.comk"

Set-Mailbox "phil.webb" -WindowsEmailAddress phil.webb@smurfitkappa.co.uk


Add-MailboxPermission -Identity "tannochside.estimating@smurfitkappa.co.uk" -User "hugh.mcintyre@smurfitkappa.co.uk" -AccessRights FullAccess -InheritanceType All -AutoMapping $false

Add-ADPermission "tannochside.estimating@smurfitkappa.co.uk" -Trustee "hugh.mcintyre@smurfitkappa.co.uk" -AccessRights SendAs -InheritanceType All


Get-Moverequest "Diss.ShiftManagers@smurfitkappa.co.uk"



Set-MailboxAutoReplyConfiguration -Identity "james.wylde@smurfitkappa.co.uk" -Autoreplystate Enabled -InternalMessage "test" -ExternalMessage "test"

Add-MailboxfolderPermission -Identity james.wylde@smurfitkappa.co.uk:\Calendar -User matt.davies@smurfitkappa.co.uk -AccessRights Reviewer -SendNotificationToUser $true

Remove-MailboxfolderPermission -Identity james.wylde@smurfitkappa.co.uk:\Calendar -User matt.davies@smurfitkappa.co.uk -AccessRights Reviewer


Add-MailboxfolderPermission -Identity james.wylde@smurfitkappa.co.uk:\Calendar -User matt.davies@smurfitkappa.co.uk -AccessRights AvailabilityOnly -SendNotificationToUser $true


Get-mailboxfolderpermission -Identity james.wylde@smurfitkappa.co.uk:\Calendar -User matt.davies@smurfitkappa.co.uk


KI 2643 - Add calendar permissions via. Exchange Online Shell
https://ukithelpdesk.uk.kappapackaging.com/tas/secure/mango/window/25?t=1614686355406


Meeting room permissions
Add-RecipientPermission "MeetingRoom.Corby@smurfitkappa.co.uk" -trustee "Mike.Devine@smurfitkappa.co.uk" -AccessRights sendAs -Confirm:$false
Get-RecipientPermission "MeetingRoom.Corby@smurfitkappa.co.uk"
Add-MailboxPermission "MeetingRoom.Corby@smurfitkappa.co.uk" -user "Mike.Devine@smurfitkappa.co.uk" -AccessRights fullaccess -Confirm:$false