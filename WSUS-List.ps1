#   James Wylde

### Get enabled

$ErrorActionPreference = "SilentlyContinue"
$computers = get-content C:\temp\wsus.txt

foreach ($computer in $computers){

  $status = Get-ADComputer -Identity $computer -Properties * | select enabled -ErrorAction SilentlyContinue
  if (($Status | Select -ExpandProperty enabled) -eq $true )
    {Write-Host $computer}

}


### Get AD Computers

Get-ADComputer -filter * -SearchBase 'OU=GBR,OU=SK,DC=group,DC=wan' | export-csv -path c:\temp\wsus-aug.csv

### Report in

$computer = Read-Host "Machine"
Function Force-WSUSCheckin($Computer)
{
   Invoke-Command -computername $Computer -scriptblock { Start-Service wuauserv -Verbose }
   $Cmd = '$updateSession = new-object -com "Microsoft.Update.Session";$updates=$updateSession.CreateupdateSearcher().Search($criteria).Updates'
   c:\temp\paexec.exe -s \\$Computer powershell.exe -command $Cmd
   Write-host "Waiting 10 seconds for SyncUpdates webservice to complete to add to the wuauserv queue so that it can be reported on"
   Start-sleep -seconds 10
   Invoke-Command -computername $Computer -scriptblock
   {
      wuauclt /detectnow
      (New-Object -ComObject Microsoft.Update.AutoUpdate).DetectNow()
      wuauclt /reportnow
      c:\windows\system32\UsoClient.exe startscan
   }
}


### Check Wsus

$computers = get-content C:\Users\a1-wyldeja\Desktop\wsus.txt

foreach ($computer in $computers){

get-wsuscomputer -NameIncludes $computer -ErrorAction stop}