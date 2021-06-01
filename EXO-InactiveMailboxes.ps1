#   James Wylde

#----------------------------------------------------------------------------------------#
#   Modules

Get-Mailbox -ResultSize Unlimited |Foreach{
Get-MailboxStatistics -Identity $_.UserPrincipalName | Select-Object DisplayName,LastLogonTime,LastUserActionTime}