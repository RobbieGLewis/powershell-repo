#   James Wylde

#----------------------------------------------------------------------------------------#
#   Modules


  Invoke-Command -Computername Uk-nor1-l28951 -ArgumentList $arguments -Scriptblock {

    Stop-Process -Name Teams -Force

    reg.exe Add "HKLM\Software\Microsoft\Windows NT\Current Version\AppCompatFlags\Layers" /v "C:\Users\USER\AppData\Local\Microsoft\Teams\current\teams.exe" /T REG_SZ /d "WIN7RTM" /F
    
    }


Invoke-Command -Computername Uk-nor1-l28951  -Scriptblock {

Stop-Process -Name Teams -Force
  
reg.exe Add "HKLM\Software\Microsoft\Windows NT\Current Version\AppCompatFlags\Layers" /v "C:\ProgramData\TayloCl\Microsoft\Teams\Update.exe" /T REG_SZ /d "WIN7RTM" /F
      
}


reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Terminal Server Client\Servers\dinner"