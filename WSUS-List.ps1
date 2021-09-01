#   James Wylde

$computers = get-content C:\Users\a1-wyldeja\Desktop\wsus.txt

foreach ($computer in $computers){

get-wsuscomputer -NameIncludes $computer -ErrorAction stop}


### Get enabled

$ErrorActionPreference = "SilentlyContinue"
$computers = get-content C:\temp\wsus.txt

foreach ($computer in $computers){

  $status = Get-ADComputer -Identity $computer -Properties * | select enabled -ErrorAction SilentlyContinue
  if (($Status | Select -ExpandProperty enabled) -eq $true )
    {Write-Host $computer}

}