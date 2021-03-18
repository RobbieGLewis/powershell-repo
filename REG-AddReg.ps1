#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules



  Invoke-Command -Computername Machine -ArgumentList $arguments -Scriptblock {

    reg.exe Add "HKLM\Software\Microsoft\Windows NT\Current Version\AppCompatFlags\Layers" /v "C:\Users\matt.davies\AppData\Local\Microsoft\Teams\current\teams.exe" /T REG_SZ /d "WIN7RTM" /F
    
    }