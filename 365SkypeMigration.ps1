$cred=get-credential
Move-CsUser -Identity admin@wyldelab.internal -Target "sipfed.online.lync.com"  -Credential $cred