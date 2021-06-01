$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session

$email = Read-Host "Email"

New-MailboxExportRequest -Mailbox $email -FilePath c:\temp\$email+backup.pst

Get-MailboxExportRequest -Status InProgress
Get-MailboxExportRequest | Get-MailboxExportRequestStatistics

Remove-PSSession $Session