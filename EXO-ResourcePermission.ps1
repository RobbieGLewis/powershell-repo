
Add-RecipientPermission "MeetingRoom.Corby@smurfitkappa.co.uk" -trustee "Mike.Devine@smurfitkappa.co.uk" -AccessRights sendAs -Confirm:$false
Get-RecipientPermission "MeetingRoom.Corby@smurfitkappa.co.uk"
Add-MailboxPermission "MeetingRoom.Corby@smurfitkappa.co.uk" -user "Mike.Devine@smurfitkappa.co.uk" -AccessRights fullaccess -Confirm:$false