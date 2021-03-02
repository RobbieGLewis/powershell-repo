#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules

Invoke-Command -ComputerName PC01 -Scriptblock { New-SmbMapping -LocalPath 'S:' -RemotePath '\\DC01\S' -UserName Get-Credential.UserName -Password Get-Credential.GetNetworkCredential.Password }