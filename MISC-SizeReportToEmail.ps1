

#----------------------------------------------------------------------------------------#
#   Modules

Clear-Host

Write-Host "Query remote machine for largest 100 files - (Requires WinRM running on target machine)"
Write-Host "`r`n"

$clientName = Read-Host "Machine to query"

psservice.exe \\$clientName -accepteula start winrm

Start-Sleep -Seconds 5  

Write-Host "`r`n"
$userName = Read-Host "User profile to query - C:\Users\"
Write-Host "`r`n"
$recipientEmail = Read-Host "Recipient email address ('@smurfitkappa.co.uk' not required)"
Write-Host "`r`n"
$senderEmail = Read-Host "Sender email address ('@smurfitkappa.co.uk' not required)"
$fileName = "File Size Report-$userName-$(Get-Date -Format 'dd-MM-yyyy').csv"

Invoke-Command -ComputerName $clientName -ScriptBlock {Get-ChildItem c:\users\$using:userName\ -Recurse -ErrorAction SilentlyContinue | Sort-Object -Descending -Property Length | Select-Object -first 100 FullName, @{Name="Size (MB) ";Expression={[Math]::Round($_.length / 1MB, 2)}}} | Export-CSV -Path C:\temp\$fileName -NoTypeInformation

$htmlBody = "<html>
<p>Hello, </p>
<p>Please find attached a report detailing the largest files on your <em>C:\</em> drive.</p>
<p>Consider the largest files that are no longer required for deletion, or by right-clicking and de-selecting <i>'Always keep on device'</i> so that it is stored in the cloud instead. </p>
<p>UK IT</p>
<p><em>Note - this email was performed by a script and the results may not be without error.</em></p>
<p><strong>_______________________________________________________________</strong></p>
<p><strong>Service Desk</strong></p>
<p><em>UK IT</em></p>
<p>&hellip;</p>
<p><strong>Smurfit Kappa </strong>UK</p>
<p><em>3<sup>rd</sup> Floor, Cunard Building, Water Street, Liverpool, L3 1SF </em></p>
<p>&hellip;</p>
<p>Service Desk:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +44 (0) 345 023 0400</p>
<p>Out Of Hours:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+44 (0) 788 523 1562</p>
<p>&nbsp;</p>
</html>
"

Send-MailMessage -From $senderEmail@smurfitkappa.co.uk -To $recipientEmail@smurfitkappa.co.uk -CC $senderEmail@smurfitkappa.co.uk  -Subject "Largest Files on $clientName for $userName" -BodyAsHtml $htmlBody -Attachments c:\temp\$fileName -DeliveryNotificationOption OnSuccess, OnFailure -Credential (Get-Credential -Message "Enter your email credentials") -SmtpServer 'mail.eu.smurfitkappa.com' -Port 25

Write-Host "`r`n"
Write-Host "******************************************************************************" -ForegroundColor White -BackgroundColor Black
Write-Host "Finished - Results are located c:\temp\$filename" -ForegroundColor White -BackgroundColor Black
Write-Host "Sender will receive notification of successful sending via email.             " -ForegroundColor White -BackgroundColor Black
Write-Host "******************************************************************************" -ForegroundColor White -BackgroundColor Black




#####

