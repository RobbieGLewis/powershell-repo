#   James Wylde 2019
#   ferus-wylde@github

# Modules

$Creds = get-credential
Move-CsUser -Identity admin@wyldelab.internal -Target "sipfed.online.lync.com"  -Credential $Creds


# U:
# P:
# T: