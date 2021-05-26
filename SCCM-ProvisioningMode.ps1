#   James Wylde

#----------------------------------------------------------------------------------------#
#   Modules

Invoke-WmiMethod -Namespace root\CCM -Class SMS_Client -Name SetClientProvisioningMode -ArgumentList $false

HKLM\SOFTWARE\Microsoft\CCM\CcmExec ProvisioningMode False