#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules


Clear-Host
$clientName = Read-Host "Machine"
$userName = Read-Host "User"
$recipientEmail = Read-Host "User Email"
Invoke-Command -ComputerName $clientName -ScriptBlock {Get-ChildItem c:\users\$using:userName\ -Recurse -ErrorAction SilentlyContinue | Sort-Object -Descending -Property Length | Select-Object -first 25 FullName, @{Name="Size (MB) ";Expression={[Math]::Round($_.length / 1MB, 2)}}} | Export-CSV -NoTypeInformation -Path C:\temp\largeFiles.csv

#$outFile = "c:\temp\largeFiles.csv"
#$emailBody = Get-Content $outFile | Out-String

Send-MailMessage -From 'james.wylde@smurfitkappa.co.uk' -To $recipientEmail -Subject 'Large Files' -Body "Please find attached large files on your machine." -Attachments c:\temp\largeFiles.csv -DeliveryNotificationOption OnSuccess, OnFailure -Credential (Get-Credential "") -SmtpServer 'mail.eu.smurfitkappa.com' -Port 25