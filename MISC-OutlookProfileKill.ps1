#   James Wylde 2020

#----------------------------------------------------------------------------------------#
#   Modules


    Get-ChildItem $env:LOCALAPPDATA\Microsoft\Outlook\* -Include *.ost, *.nst, *.pst | Remove-Item
    Set-Location HKCU:
    $Profiles = Get-ChildItem 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Outlook\Profiles' |ForEach-Object {
        Get-ChildItem $_.Name |ForEach-Object {
            Get-ChildItem -Path $_.Name
        } 
    }
     
    foreach($Profile in $Profiles){
        try{
            $AccountName = Get-ItemPropertyValue -Path $Profile.Name -Name 'Account Name' -ErrorAction Stop
            if($AccountName $AccountName -like '*@*'){
                'HKCU:\' + ($Profile.Name.Split('\')[1..7] -join '\') | Remove-Item -Recurse
            }
        }catch{
            Continue
        }
    }
}
