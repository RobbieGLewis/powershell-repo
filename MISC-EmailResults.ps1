#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules

Clear-Host

Write-Host "Query 50 largest files on remote machine - (Requires WinRM running on target machine)"
Write-Host "`r`n"

$clientName = Read-Host "Machine to query"
$userName = Read-Host "User profile to query - C:\Users\"
$recipientEmail = Read-Host "Recipient email address"
$fileName = "File Size Report-$userName-$(Get-Date -Format 'dd-MM-yyyy').csv"

Invoke-Command -ComputerName $clientName -ScriptBlock {Get-ChildItem c:\users\$using:userName\ -Recurse -ErrorAction SilentlyContinue | Sort-Object -Descending -Property Length | Select-Object -first 25 FullName, @{Name="Size (MB) ";Expression={[Math]::Round($_.length / 1MB, 2)}}} | Export-CSV -Path C:\temp\$fileName -NoTypeInformation

$htmlBody = "<html>
<p>Hello, </p>
<p>Please find attached a report detailing the largest files on your <em>C:\</em> drive.</p>
<p>Thanks</p>
<p>UK IT</p>
<p><em>Note - this email was performed automagically and the results may not be without error.</em></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><strong>------------------------------</strong></p>
<p><strong>Service Desk</strong></p>
<p><em>UK IT</em></p>
<p>&hellip;</p>
<p><strong>&nbsp;</strong></p>
<p><strong>Smurfit Kappa </strong>UK</p>
<p><em>3<sup>rd</sup> Floor, Cunard Building, Water Street, Liverpool, L3 1SF </em></p>
<p>&hellip;</p>
<p>&nbsp;</p>
<p>Service Desk:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +44 (0) 345 023 0400</p>
<p>Out Of Hours:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+44 (0) 788 523 1562</p>
<p>&nbsp;</p>
</html>
"

Send-MailMessage -From 'james.wylde@smurfitkappa.co.uk' -To $recipientEmail -Subject "Largest Files on $clientName for $userName" -BodyAsHtml $htmlBody -Attachments c:\temp\$fileName -DeliveryNotificationOption OnSuccess, OnFailure -Credential (Get-Credential -Message "Enter your A2 credentials") -SmtpServer 'mail.eu.smurfitkappa.com' -Port 25

Write-Host "`r`n"
Write-Host "*******************************************************************************" -ForegroundColor White -BackgroundColor Black
Write-Host "Finished - Results are located c:\temp\"$filename -ForegroundColor White -BackgroundColor Black
Write-Host "Sender will receive notification of successful sending via email.              " -ForegroundColor White -BackgroundColor Black
Write-Host "*******************************************************************************" -ForegroundColor White -BackgroundColor Black




#####


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