#   James Wylde

#----------------------------------------------------------------------------------------#
#   Modules

Get-MailboxStatistics -Identity "person@email.com" | ft displayname, totalitemsize, database*quota

Get-Mailbox -Identity "person@email.com" | select *quota*