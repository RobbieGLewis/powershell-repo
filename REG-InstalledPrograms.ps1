#   James Wylde

Invoke-Command -ComputerName PC01 -ScriptBlock {get-Itemproperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object Displayname, publisher, installdate} | Format-table -AutoSize