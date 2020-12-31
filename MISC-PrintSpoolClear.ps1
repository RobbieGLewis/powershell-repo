#   James Wylde 2019
#   github.com/jameswylde

# Modules

Stop-Service -Name Spooler -Force

Move-Item -Path "$env:SystemRoot\System32\spool\PRINTERS\*.*" -Destination 'C:\temp\' -Force

Remove-Item -Path "$env:SystemRoot\System32\spool\PRINTERS\*.*"

Start-Service -Name Spooler
