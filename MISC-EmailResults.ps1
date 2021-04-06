#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules

Clear-Host
$clientName = Read-Host "Machine"
$userName = Read-Host "User"
$recipientEmail = Read-Host "User Email"
Invoke-Command -ComputerName $clientName -ScriptBlock {Get-ChildItem c:\users\$using:userName\ -Recurse -ErrorAction SilentlyContinue | Sort-Object -Descending -Property Length | Select-Object -first 25 FullName, @{Name="Size (MB) ";Expression={[Math]::Round($_.length / 1MB, 2)}}} | Export-CSV -NoTypeInformation -Path C:\temp\largeFiles.csv

$htmlBody = "<html>
<p>Hi $userName</p>
<p>Please find attached a report detailing the largest files on your <em>C:\</em> drive.</p>
<p>Thanks</p>
<p><em>Note - this email was performed by a bot.</em></p>
</html>
"

Send-MailMessage -From 'james.wylde@smurfitkappa.co.uk' -To $recipientEmail -Subject "Largest Files on $clientName for $userName" -BodyAsHtml $htmlBody -Attachments c:\temp\largeFiles.csv -DeliveryNotificationOption OnSuccess, OnFailure -Credential (Get-Credential "") -SmtpServer 'mail.eu.smurfitkappa.com' -Port 25

###


Clear-Host
$clientName = Read-Host "Machine"
$userName = Read-Host "User"
$recipientEmail = Read-Host "User Email"
Invoke-Command -ComputerName $clientName -ScriptBlock {Get-ChildItem c:\users\$using:userName\ -Recurse -ErrorAction SilentlyContinue | Sort-Object -Descending -Property Length | Select-Object -first 25 FullName, @{Name="Size (MB) ";Expression={[Math]::Round($_.length / 1MB, 2)}}} | Export-CSV -NoTypeInformation -Path C:\temp\largeFiles.csv

#$outFile = "c:\temp\largeFiles.csv"
#$emailBody = Get-Content $outFile | Out-String