#   James Wylde

#----------------------------------------------------------------------------------------#
#   Modules

Get-Mailbox -ResultSize Unlimited |ForEach-Object{
Get-MailboxStatistics -Identity $_.UserPrincipalName | Select-Object DisplayName,LastLogonTime,LastUserActionTime}