
#----------------------------------------------------------------------------------------#

#   Imports

Import-Module GroupPolicy 

#----------------------------------------------------------------------------------------#

#   VARS

$DomainName = $env:USERDNSDOMAIN 

#$FileOut = 'C:\Temp\Exports\GPOsearch.csv'

#----------------------------------------------------------------------------------------#

#   Search

$string = Read-Host -Prompt "String" 


 
#----------------------------------------------------------------------------------------#

#   GPOs in Domain

Write-Host "Searching Group Policy Objects in $DomainName" 
$allGposInDomain = Get-GPO -All -Domain $DomainName 
[string[]] $MatchedGPOList = @()

#----------------------------------------------------------------------------------------#

#   GPO XML search

Write-Host "Starting search...." 
foreach ($gpo in $allGposInDomain) { 
    $report = Get-GPOReport -Guid $gpo.Id -ReportType Xml 
    if ($report -match $string) { 
        Write-Host "****************** Match found in: $($gpo.DisplayName) ******************" -foregroundcolor "Green"
        $MatchedGPOList += "$($gpo.DisplayName)";
    } 
    else { 
        Write-Host "No match in: $($gpo.DisplayName)" -foregroundcolor "Red"
    } 
} 
Write-Host " `r`n "
Write-Host "Results: **************" -foregroundcolor "Yellow"
foreach ($match in $MatchedGPOList) { 
    Write-Host "Match found in: $($match)" -foregroundcolor "Green"

#Write-Output $Output | Out-File $FileOut -Encoding utf8 -Append
}

