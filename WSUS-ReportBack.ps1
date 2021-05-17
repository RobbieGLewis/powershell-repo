#   James Wylde

#----------------------------------------------------------------------------------------#
#   Get if back in WSUS

$computers = get-content C:\Users\a1-wyldeja\Desktop\wsus.txt

foreach ($computer in $computers){

get-wsuscomputer -NameIncludes $computer -ErrorAction stop}

#----------------------------------------------------------------------------------------#
#   Kill Software Distribution empties

net stop wuauserv
rd /s /q %systemroot%\SoftwareDistribution
net start wuauserv

#----------------------------------------------------------------------------------------#
#   Stop/Start services

net stop bits
net stop wuauserv
net stop cryptsvc 

sleep -s 5

net start bits
net start wuauserv
net stop cryptsvc

#----------------------------------------------------------------------------------------#
#   Kill qmgr database

Del "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr*.dat"

Del C:\ProgramData\Microsoft\Network\Downloader\qmgr*.dat

#----------------------------------------------------------------------------------------#
#   Backup and reset BITS

Ren %Systemroot%\SoftwareDistribution\DataStore DataStore.bak
Ren %Systemroot%\SoftwareDistribution\Download Download.bak
Ren %Systemroot%\System32\catroot2 catroot2.bak

sc.exe sdset bits D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
sc.exe sdset wuauserv D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)

#----------------------------------------------------------------------------------------#
#   Reregister BITS .dlls

cd /d %windir%\system32

regsvr32.exe atl.dll
regsvr32.exe urlmon.dll
regsvr32.exe mshtml.dll
regsvr32.exe shdocvw.dll
regsvr32.exe browseui.dll
regsvr32.exe jscript.dll
regsvr32.exe vbscript.dll
regsvr32.exe scrrun.dll
regsvr32.exe msxml.dll
regsvr32.exe msxml3.dll
regsvr32.exe msxml6.dll
regsvr32.exe actxprxy.dll
regsvr32.exe softpub.dll
regsvr32.exe wintrust.dll
regsvr32.exe dssenh.dll
regsvr32.exe rsaenh.dll
regsvr32.exe gpkcsp.dll
regsvr32.exe sccbase.dll
regsvr32.exe slbcsp.dll
regsvr32.exe cryptdlg.dll
regsvr32.exe oleaut32.dll
regsvr32.exe ole32.dll
regsvr32.exe shell32.dll
regsvr32.exe initpki.dll
regsvr32.exe wuapi.dll
regsvr32.exe wuaueng.dll
regsvr32.exe wuaueng1.dll
regsvr32.exe wucltui.dll
regsvr32.exe wups.dll
regsvr32.exe wups2.dll
regsvr32.exe wuweb.dll
regsvr32.exe qmgr.dll
regsvr32.exe qmgrprxy.dll
regsvr32.exe wucltux.dll
regsvr32.exe muweb.dll
regsvr32.exe wuwebv.dll

#----------------------------------------------------------------------------------------#
#   Winsock reset [last resort]

netsh winsock reset


#----------------------------------------------------------------------------------------#
#   BITS queue clear

bitsadmin.exe /reset /allusers