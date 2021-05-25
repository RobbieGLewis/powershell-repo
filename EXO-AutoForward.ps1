#   James Wylde

#----------------------------------------------------------------------------------------#
#   Modules

Set-Mailbox -Identity "person@email.com" -DeliverToMailboxAndForward $true -ForwardingAddress "person2@email.com"

Set-Mailbox -Identity "person@email.com" ForwardingAddress "person2@email.com"

Get-Mailbox -Identity "person@email.com" | Format-List ForwardingAddress,DeliverToMailboxAndForward
