#   James Wylde 2020
#   github.com/jameswylde

#----------------------------------------------------------------------------------------#
#   Modules

Get-ChildItem c:\temp\*.txt -Recurse | Select-String -Pattern WHATYOULOOKINGFOR

rsop 