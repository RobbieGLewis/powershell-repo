$count = 9
do {
    Write-Host $count -ForegroundColor yellow -BackgroundColor red
    Sleep 1
    $count--
} while ($count -gt 0)



netsh advfirewall monitor show consec verbose > c:\temp\output.txt
netsh advfirewall monitor show currentprofile
netsh advfirewall set allprofiles state off

netsh firewall set opmode mode=DISABLE




Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters\NegativeCachePeriod    created and changed to 0
NLASVc - automatic delayed restart resolved
Toggled on/off DNS on adapter
Flushed and registered DNS