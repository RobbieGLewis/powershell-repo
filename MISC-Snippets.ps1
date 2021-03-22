$count = 9
do {
    Write-Host $count -ForegroundColor yellow -BackgroundColor red
    Sleep 1
    $count--
} while ($count -gt 0)



netsh advfirewall monitor show consec verbose > c:\temp\output.txt