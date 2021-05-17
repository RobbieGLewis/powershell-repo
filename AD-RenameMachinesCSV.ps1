#   James Wylde

$domCreds = Get-Credential -Message "Enter your A2 credentials"

$computers = Import-CSV c:\temp\computers.csv

foreach ($oldName in $computers){
    Rename-Computer -ComputerName $computers.oldName -NewName $computers.newName -DomainCredential $domCreds -Force -Restart
    Restart-Computer $computers.oldName
}