$Mailboxes = Get-Mailbox -ResultSize 50
foreach ($mailbox in $Mailboxes) {
    Get-MailboxFolderPermission -Identity ($mailbox.UserPrincipalName + ":\Calendar") -user "james.wylde@smurfitkappa.co.uk"  | select-object @{Label = "Mailbox"; Expression = {($mailbox.UserPrincipalName)}}, FolderName, User , AccessRights }