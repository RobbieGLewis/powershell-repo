#   James Wylde

#----------------------------------------------------------------------------------------#
#   Modules

Set-Mailbox "user" -EmailAddress "SMTP:name@email.com"

Set-Mailbox "user" -PrimarySMTPAddress "SMTP:name@email.com"

Set-Mailbox "user" -WindowsEmailAddress name@email.com

Get-Mailbox -Identity "user" | Select-Object DisplayName,Alias,PrimarySMTPAddress,ForwardingAddress,ForwardingSMTPAddress
