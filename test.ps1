#   James Wylde 2019
#   ferus-wylde@github

# Modules

New-PSSession -ComputerName -PC01

Move-Item -Path "C:\Users\admin\Documents\BGINFO\*.*" -Destination 'C:\temp\' -Force

Remove-Item -Path "C:\Users\admin\Documents\BGINFO\*.*"

