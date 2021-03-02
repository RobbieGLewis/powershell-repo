#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules

New-PSSession -ComputerName PC01

$process = Get-Process mmc -ErrorAction SilentlyContinue
if ($process) {
  $process.CloseMainWindow()
  Sleep 5
  if (!$process.HasExited) {
    $process | Stop-Process -Force
  }
}
