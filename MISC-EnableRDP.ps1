#   James Wylde 2020
#   github.com/jameswylde


#----------------------------------------------------------------------------------------#
#   Reg RDS fix

Enter-PSSession -ComputerName PC01 -Credential group\a2-wyldeja

Set-Itemproperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fdenytsconnections" -Value 0

Enable-NetFirewallRule -DisplayGroup "Remote Desktop"


#----------------------------------------------------------------------------------------#
#   Psexec WINRM

psexec.exe \\SERVER -s c:\windows\system32\winrm.cmd quickconfig -quiet

#----------------------------------------------------------------------------------------#
#   WMI WINRM

$SessionArgs = @{
    ComputerName  = 'ServerB'
    Credential    = Get-Credential
    SessionOption = New-CimSessionOption -Protocol Dcom
}
$MethodArgs = @{
    ClassName     = 'Win32_Process'
    MethodName    = 'Create'
    CimSession    = New-CimSession @SessionArgs
    Arguments     = @{
        CommandLine = "powershell Start-Process powershell -ArgumentList 'Enable-PSRemoting -Force'"
    }
}
Invoke-CimMethod @MethodArgs