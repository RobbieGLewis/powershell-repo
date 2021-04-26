#####################################################
#
# Load External Form Assembly
#
#####################################################
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName PresentationFramework

$Form1 = New-Object System.Windows.Forms.Form

$Software = New-Object System.Windows.Forms.TabControl
$tabPage1 = New-Object System.Windows.Forms.TabPage
$tabPage2 = New-Object System.Windows.Forms.TabPage
$Exit_Button = New-Object System.Windows.Forms.Button
$comboBox1 = New-Object System.Windows.Forms.ComboBox
$AppInstall_button = New-Object System.Windows.Forms.Button
$textBox1 = New-Object System.Windows.Forms.TextBox
$Connect_Button = New-Object System.Windows.Forms.Button
$comboBox2 = New-Object System.Windows.Forms.ComboBox
$OSDInstall_button = New-Object System.Windows.Forms.Button
$radioButton1 = New-Object System.Windows.Forms.RadioButton
$radioButton2 = New-Object System.Windows.Forms.RadioButton
$radioButton3 = New-Object System.Windows.Forms.RadioButton
$radioButton4 = New-Object System.Windows.Forms.RadioButton
$radioButton5 = New-Object System.Windows.Forms.RadioButton
$radioButton6 = New-Object System.Windows.Forms.RadioButton
$radioButton7 = New-Object System.Windows.Forms.RadioButton
$radioButton8 = New-Object System.Windows.Forms.RadioButton
$Run_button5 = New-Object System.Windows.Forms.Button
$label1 = New-Object System.Windows.Forms.Label
$label2 = New-Object System.Windows.Forms.Label
$comboBox3 = New-Object System.Windows.Forms.ComboBox
$label3 = New-Object System.Windows.Forms.Label
$Uninstall_button = New-Object System.Windows.Forms.Button
$label4 = New-Object System.Windows.Forms.Label
$label5 = New-Object System.Windows.Forms.Label
$button7 = New-Object System.Windows.Forms.Button
#####################################################
#
# Software Tab Layout
#
#####################################################
$Software.Controls.Add($tabPage1)
$Software.Controls.Add($tabPage2)
$Software.Location = New-Object System.Drawing.Point(12, 41)
$Software.Name = "Software"
$Software.SelectedIndex = 0
$Software.Size = New-Object System.Drawing.Size(541, 288)
$Software.TabIndex = 0
#####################################################
#
# Software tab controls
#
#####################################################
$tabPage1.Controls.Add($Uninstall_button)
$tabPage1.Controls.Add($label3)
$tabPage1.Controls.Add($comboBox3)
$tabPage1.Controls.Add($label2)
$tabPage1.Controls.Add($label1)
$tabPage1.Controls.Add($OSDInstall_button)
$tabPage1.Controls.Add($comboBox2)
$tabPage1.Controls.Add($AppInstall_button)
$tabPage1.Controls.Add($comboBox1)
$tabPage1.Location = New-Object System.Drawing.Point(4, 25)
$tabPage1.Name = "tabPage1"
$tabPage1.Padding = New-Object System.Windows.Forms.Padding(3)
$tabPage1.Size = New-Object System.Drawing.Size(533, 259)
$tabPage1.TabIndex = 0
$tabPage1.Text = "Software"
$tabPage1.UseVisualStyleBackColor = $true
#####################################################
#
# admin tab controls
#
#####################################################
$tabPage2.Controls.Add($Run_button5)
$tabPage2.Controls.Add($radioButton8)
$tabPage2.Controls.Add($radioButton7)
$tabPage2.Controls.Add($radioButton6)
$tabPage2.Controls.Add($radioButton5)
$tabPage2.Controls.Add($radioButton4)
$tabPage2.Controls.Add($radioButton3)
$tabPage2.Controls.Add($radioButton2)
$tabPage2.Controls.Add($radioButton1)
$tabPage2.Location = New-Object System.Drawing.Point(4, 25)
$tabPage2.Name = "tabPage2"
$tabPage2.Padding = New-Object System.Windows.Forms.Padding(3)
$tabPage2.Size = New-Object System.Drawing.Size(533, 259)
$tabPage2.TabIndex = 1
$tabPage2.Text = "Admin"
$tabPage2.UseVisualStyleBackColor = $true
#####################################################
#
# exit button
#
#####################################################
$Exit_Button.Location = New-Object System.Drawing.Point(478, 337)
$Exit_Button.Name = "button1"
$Exit_Button.Size = New-Object System.Drawing.Size(75, 23)
$Exit_Button.TabIndex = 1
$Exit_Button.Text = "Exit"
$Exit_Button.UseVisualStyleBackColor = $true
#####################################################
#
# Applications available combo box
#
#####################################################
$comboBox1.FormattingEnabled = $true
$comboBox1.Location = New-Object System.Drawing.Point(6, 48)
$comboBox1.Name = "comboBox1"
$comboBox1.Size = New-Object System.Drawing.Size(413, 24)
$comboBox1.TabIndex = 0
#####################################################
#
# app install button
#
#####################################################
$AppInstall_button.Location = New-Object System.Drawing.Point(440, 48)
$AppInstall_button.Name = "button2"
$AppInstall_button.Size = New-Object System.Drawing.Size(75, 23)
$AppInstall_button.TabIndex = 1
$AppInstall_button.Text = "Install"
$AppInstall_button.UseVisualStyleBackColor = $true
#####################################################
#
# computer name text box
#
#####################################################
$textBox1.Location = New-Object System.Drawing.Point(22, 12)
$textBox1.Name = "textBox1"
$textBox1.Size = New-Object System.Drawing.Size(208, 22)
$textBox1.TabIndex = 2
#####################################################
#
# connect button
#
#####################################################
$Connect_Button.Location = New-Object System.Drawing.Point(237, 12)
$Connect_Button.Name = "button3"
$Connect_Button.Size = New-Object System.Drawing.Size(75, 23)
$Connect_Button.TabIndex = 3
$Connect_Button.Text = "Connect"
$Connect_Button.UseVisualStyleBackColor = $true
#####################################################
#
# osd combo box
#
#####################################################
$comboBox2.FormattingEnabled = $true
$comboBox2.Location = New-Object System.Drawing.Point(7, 120)
$comboBox2.Name = "comboBox2"
$comboBox2.Size = New-Object System.Drawing.Size(412, 24)
$comboBox2.TabIndex = 2
#####################################################
#
# osd install button
#
#####################################################
$OSDInstall_button.Location = New-Object System.Drawing.Point(439, 120)
$OSDInstall_button.Name = "button4"
$OSDInstall_button.Size = New-Object System.Drawing.Size(75, 23)
$OSDInstall_button.TabIndex = 3
$OSDInstall_button.Text = "Install"
$OSDInstall_button.UseVisualStyleBackColor = $true
#####################################################
#
# software inventory radial button
#
#####################################################
$radioButton1.AutoSize = $true
$radioButton1.Location = New-Object System.Drawing.Point(19, 24)
$radioButton1.Name = "radioButton1"
$radioButton1.Size = New-Object System.Drawing.Size(184, 21)
$radioButton1.TabIndex = 0
$radioButton1.TabStop = $true
$radioButton1.Text = "Software Inventory Cycle"
$radioButton1.UseVisualStyleBackColor = $true
#####################################################
#
# hardware inventory radial button 
#
#####################################################
$radioButton2.AutoSize = $true
$radioButton2.Location = New-Object System.Drawing.Point(19, 51)
$radioButton2.Name = "radioButton2"
$radioButton2.Size = New-Object System.Drawing.Size(190, 21)
$radioButton2.TabIndex = 1
$radioButton2.TabStop = $true
$radioButton2.Text = "Hardware Inventory Cycle"
$radioButton2.UseVisualStyleBackColor = $true
#
# radioButton3
#
$radioButton3.AutoSize = $true
$radioButton3.Location = New-Object System.Drawing.Point(19, 78)
$radioButton3.Name = "radioButton3"
$radioButton3.Size = New-Object System.Drawing.Size(186, 21)
$radioButton3.TabIndex = 2
$radioButton3.TabStop = $true
$radioButton3.Text = "Reset ConfigMgr Policies"
$radioButton3.UseVisualStyleBackColor = $true
#
# radioButton4
#
$radioButton4.AutoSize = $true
$radioButton4.Location = New-Object System.Drawing.Point(19, 105)
$radioButton4.Name = "radioButton4"
$radioButton4.Size = New-Object System.Drawing.Size(178, 21)
$radioButton4.TabIndex = 3
$radioButton4.TabStop = $true
$radioButton4.Text = "Repair ConfigMgr Client"
$radioButton4.UseVisualStyleBackColor = $true
#
# radioButton5
#
$radioButton5.AutoSize = $true
$radioButton5.Location = New-Object System.Drawing.Point(19, 132)
$radioButton5.Name = "radioButton5"
$radioButton5.Size = New-Object System.Drawing.Size(190, 21)
$radioButton5.TabIndex = 4
$radioButton5.TabStop = $true
$radioButton5.Text = "Uninstall ConfigMgr Client"
$radioButton5.UseVisualStyleBackColor = $true
#
# radioButton6
#
$radioButton6.AutoSize = $true
$radioButton6.Location = New-Object System.Drawing.Point(19, 159)
$radioButton6.Name = "radioButton6"
$radioButton6.Size = New-Object System.Drawing.Size(230, 21)
$radioButton6.TabIndex = 5
$radioButton6.TabStop = $true
$radioButton6.Text = "Remove ConfigMgr Cache Items"
$radioButton6.UseVisualStyleBackColor = $true
#
# radioButton7
#
$radioButton7.AutoSize = $true
$radioButton7.Location = New-Object System.Drawing.Point(19, 186)
$radioButton7.Name = "radioButton7"
$radioButton7.Size = New-Object System.Drawing.Size(161, 21)
$radioButton7.TabIndex = 6
$radioButton7.TabStop = $true
$radioButton7.Text = "Get Logged On User"
$radioButton7.UseVisualStyleBackColor = $true
#
# radioButton8
#
$radioButton8.AutoSize = $true
$radioButton8.Location = New-Object System.Drawing.Point(19, 214)
$radioButton8.Name = "radioButton8"
$radioButton8.Size = New-Object System.Drawing.Size(195, 21)
$radioButton8.TabIndex = 7
$radioButton8.TabStop = $true
$radioButton8.Text = "Get Pending Reboot State"
$radioButton8.UseVisualStyleBackColor = $true
#
# button5
#
$Run_button5.Location = New-Object System.Drawing.Point(452, 230)
$Run_button5.Name = "button5"
$Run_button5.Size = New-Object System.Drawing.Size(75, 23)
$Run_button5.TabIndex = 8
$Run_button5.Text = "Run"
$Run_button5.UseVisualStyleBackColor = $true
#
# label1
#
$label1.AutoSize = $true
$label1.Location = New-Object System.Drawing.Point(6, 19)
$label1.Name = "label1"
$label1.Size = New-Object System.Drawing.Size(180, 17)
$label1.TabIndex = 4
$label1.Text = "Software Available to Install"
#
# label2
#
$label2.AutoSize = $true
$label2.Location = New-Object System.Drawing.Point(6, 90)
$label2.Name = "label2"
$label2.Size = New-Object System.Drawing.Size(221, 17)
$label2.TabIndex = 5
$label2.Text = "OS Deployment Availale for Install"
#
# comboBox3
#
$comboBox3.FormattingEnabled = $true
$comboBox3.Location = New-Object System.Drawing.Point(9, 192)
$comboBox3.Name = "comboBox3"
$comboBox3.Size = New-Object System.Drawing.Size(410, 24)
$comboBox3.TabIndex = 6
#
# label3
#
$label3.AutoSize = $true
$label3.Location = New-Object System.Drawing.Point(6, 161)
$label3.Name = "label3"
$label3.Size = New-Object System.Drawing.Size(175, 17)
$label3.TabIndex = 7
$label3.Text = "Software Already Installed "
#
# button6
#
$Uninstall_button.Location = New-Object System.Drawing.Point(440, 192)
$Uninstall_button.Name = "button6"
$Uninstall_button.Size = New-Object System.Drawing.Size(75, 23)
$Uninstall_button.TabIndex = 8
$Uninstall_button.Text = "Uninstall"
$Uninstall_button.UseVisualStyleBackColor = $true
#
# label4
#
$label4.AutoSize = $true
$label4.Location = New-Object System.Drawing.Point(1, 349)
$label4.Name = "label4"
$label4.Size = New-Object System.Drawing.Size(285, 17)
$label4.TabIndex = 5
$label4.Text = "Created By Smurfit Kappa UK Corrugated IT"
#
# label5
#
$label5.AutoSize = $true
$label5.Location = New-Object System.Drawing.Point(351, 15)
$label5.Name = "label5"
$label5.Size = New-Object System.Drawing.Size(111, 17)
$label5.TabIndex = 6
$label5.Text = "Get Win Version"
#
# button7
#
$button7.Location = New-Object System.Drawing.Point(468, 11)
$button7.Name = "button7"
$button7.Size = New-Object System.Drawing.Size(75, 23)
$button7.TabIndex = 7
$button7.Text = "Version"
$button7.UseVisualStyleBackColor = $true
#
# Form1
#
$Form1.ClientSize = New-Object System.Drawing.Size(559, 372)
$Form1.Controls.Add($button7)
$Form1.Controls.Add($label5)
$Form1.Controls.Add($label4)
$Form1.Controls.Add($Connect_Button)
$Form1.Controls.Add($textBox1)
$Form1.Controls.Add($Exit_Button)
$Form1.Controls.Add($Software)
$Form1.Name = "Form1"
$Form1.Text = "CCM Admin"


#####################################################
#
# functions used on software tab
#
#####################################################

#combo box function to populate boxes with info
function Load-ComboBox 
	{
	<#
		.SYNOPSIS
			This functions helps you load items into a ComboBox.
	
		.DESCRIPTION
			Use this function to dynamically load items into the ComboBox control.
	
		.PARAMETER  ComboBox
			The ComboBox control you want to add items to.
	
		.PARAMETER  Items
			The object or objects you wish to load into the ComboBox's Items collection.
	
		.PARAMETER  DisplayMember
			Indicates the property to display for the items in this control.
		
		.PARAMETER  Append
			Adds the item(s) to the ComboBox without clearing the Items collection.
		
		.EXAMPLE
			Load-ComboBox $combobox1 "Red", "White", "Blue"
		
		.EXAMPLE
			Load-ComboBox $combobox1 "Red" -Append
			Load-ComboBox $combobox1 "White" -Append
			Load-ComboBox $combobox1 "Blue" -Append
		
		.EXAMPLE
			Load-ComboBox $combobox1 (Get-Process) "ProcessName"
	#>
		Param (
			[ValidateNotNull()]
			[Parameter(Mandatory=$true)]
			[System.Windows.Forms.ComboBox]$ComboBox,
			[ValidateNotNull()]
			[Parameter(Mandatory=$true)]
			$Items,
		    [Parameter(Mandatory=$false)]
			[string]$DisplayMember,
			[switch]$Append
		)
		
		if(-not $Append)
		{
			$ComboBox.Items.Clear()	
		}
		
		if($Items -is [Object[]])
		{
			$ComboBox.Items.AddRange($Items)
		}
		elseif ($Items -is [System.Collections.IEnumerable])
		{
			$ComboBox.BeginUpdate()
			foreach($obj in $Items)
			{
				$ComboBox.Items.Add($obj)	
			}
			$ComboBox.EndUpdate()
		}
		else
		{
			$ComboBox.Items.Add($Items)	
		}
	
		$ComboBox.DisplayMember = $DisplayMember	
	}

function Get-WindowsVersion
{
	[CmdletBinding()]
	Param
	(
		[Parameter(Mandatory = $false,
				   ValueFromPipelineByPropertyName = $true,
				   ValueFromPipeline = $true
				   )]
		[string[]]$ComputerName = $env:COMPUTERNAME
	)
	
	
	Begin
	{
		$Table = New-Object System.Data.DataTable
		$Table.Columns.AddRange(@("ComputerName", "Windows Edition", "Version", "OS Build"))
	}
	Process
	{
		Foreach ($Computer in $ComputerName)
		{
			$Code = {
				$ProductName = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name ProductName).ProductName
				Try
				{
					$Version = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name ReleaseID -ErrorAction Stop).ReleaseID
				}
				Catch
				{
					$Version = "N/A"
				}
				$CurrentBuild = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name CurrentBuild).CurrentBuild
				$UBR = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name UBR).UBR
				$OSVersion = $CurrentBuild + "." + $UBR
				
				$TempTable = New-Object System.Data.DataTable
				$TempTable.Columns.AddRange(@("ComputerName", "Windows Edition", "Version", "OS Build"))
				[void]$TempTable.Rows.Add($env:COMPUTERNAME, $ProductName, $Version, $OSVersion)
				
				Return $TempTable
			}
			
			If ($Computer -eq $env:COMPUTERNAME)
			{
				$Result = Invoke-Command -ScriptBlock $Code
				[void]$Table.Rows.Add($Result.Computername, $Result.'Windows Edition', $Result.Version, $Result.'OS Build')
			}
			Else
			{
				Try
				{
					$Result = Invoke-Command -ComputerName $Computer -ScriptBlock $Code -ErrorAction Stop
					[void]$Table.Rows.Add($Result.Computername, $Result.'Windows Edition', $Result.Version, $Result.'OS Build')
				}
				Catch
				{
					$_
				}
			}
			
		}
		
	}
	End
	{
		Return $Table
	}
}

#osd install
function install-osd
{
$computername = $textbox1.text
$TaskSequenceName = $combobox2.SelectedItem
$SoftwareDistributionPolicy = Get-WmiObject -Namespace "root\ccm\policy\machine\actualconfig" -Class "CCM_SoftwareDistribution" -ComputerName $computername | Where-Object { $_.PKG_Name -like $TaskSequenceName } | Select-Object -Property PKG_Name, PKG_PackageID, ADV_AdvertisementID
$ScheduleID = Get-WmiObject -Namespace "root\ccm\scheduler" -Class "CCM_Scheduler_History" -ComputerName $computername | Where-Object { $_.ScheduleID -like "*$($SoftwareDistributionPolicy.PKG_PackageID)*" } | Select-Object -ExpandProperty ScheduleID

$TaskSequencePolicy = Get-WmiObject -Namespace "root\ccm\policy\machine\actualconfig" -Class "CCM_TaskSequence" -ComputerName $computername  | Where-Object { $_.ADV_AdvertisementID -like $SoftwareDistributionPolicy.ADV_AdvertisementID }
if ($TaskSequencePolicy.ADV_RepeatRunBehavior -notlike "RerunAlways") {
    $TaskSequencePolicy.ADV_RepeatRunBehavior = "RerunAlways"
    $TaskSequencePolicy.Put() | Out-Null
}

# Set the mandatory assignment property to true mimicing it contains assignments
$TaskSequencePolicy.Get()
$TaskSequencePolicy.ADV_MandatoryAssignments = $true
$TaskSequencePolicy.Put() | Out-Null

Invoke-WmiMethod  -ComputerName $computername -Namespace "root\ccm" -Class "SMS_Client" -Name "TriggerSchedule" -ArgumentList $ScheduleID


}

#exit button
$Exit_Button.add_click({ $Form1.close()})

#connect button
$Connect_Button.Add_Click({

if (-not $Textbox1.Text)
			{
				[System.Windows.Forms.MessageBox]::Show('No Computername Specified','Connection Error','OK','Error')
				
			}
			else
			{
				$Computername = $Textbox1.Text
			}
			
			
			
			
			If (-not (Test-Connection -ComputerName $Computername -Count 1 -Quiet))
			{
				[System.Windows.Forms.MessageBox]::Show('No such computer or computer is offline','Connection Error','OK','Error')
				
				
			}
			
			Else
			{  Get-Service -Name winrm -ComputerName $computername | Set-Service -Status Running
				[System.Windows.Forms.MessageBox]::Show("connected to $computername Succesfully")
               $combobox1.Items.Clear() 
               $combobox2.Items.Clear()
               $combobox3.Items.Clear()

                # Application #
				$Application = (Get-CimInstance -ClassName CCM_Application -Namespace "root\ccm\clientSDK" -ComputerName $Computername | Where-Object { $_.InstallState -like "NotInstalled" })
				$AppName = $Application.Name
                if ($APPName)
				{
					Load-ComboBox $ComboBox1 $AppName -Append
					$ComboBox1.SelectedIndex = 1 }
                
                # osd #
                $TaskSequenceName = "Deploy COW10 - Production - Win10 20H2 Upgrade"
                $OSD = Get-WmiObject -Namespace "root\ccm\policy\machine\actualconfig" -Class "CCM_SoftwareDistribution" -ComputerName $Computername | Where-Object { $_.PKG_Name -like $TaskSequenceName } 
                $osdname = $OSD.PKG_Name
                if ($osdname)
				{
					Load-ComboBox $ComboBox2 $osdname -Append
					$ComboBox2.SelectedIndex = 0 }

                # Installed #
				$Applicationinstall = (Get-CimInstance -ClassName CCM_Application -Namespace "root\ccm\clientSDK" -ComputerName $Computername | Where-Object { $_.InstallState -like "Installed" })
				$AppNameinstall = $Applicationinstall.Name
                if ($APPNameinstall)
				{
					Load-ComboBox $ComboBox3 $AppNameinstall -Append
					$ComboBox3.SelectedIndex = 1 }


}

}
)

$button7.add_click({ 
$computername = $textBox1.text
$version = Get-WindowsVersion -ComputerName $computername |select version
$result = $version.version
[System.Windows.Forms.MessageBox]::Show("machine is running $result" , 'Error')
})

#install app button
$AppInstall_button.add_click({
		#TODO: Place custom script here
		#[System.Windows.Forms.MessageBox]::Show('Install Button', 'Error')

Invoke-AppInstall -Computername $textbox1.text -Method Install -AppName $combobox1.SelectedItem 
})

#uninstall app button
$Uninstall_button.add_click({
		#TODO: Place custom script here
		#[System.Windows.Forms.MessageBox]::Show('Install Button', 'Error')

Invoke-AppInstall -Computername $textbox1.text -Method UnInstall -AppName $combobox3.SelectedItem 
})



$OSDInstall_button.add_click({
install-osd
[System.Windows.Forms.MessageBox]::Show('OSD Install', 'Error')
})







#####################################################
#
# admin tab functions
#
#####################################################

# Reset-CMClientPolicy function resets ConfigMgr Client Policies

Function Reset-CMClientPolicy
{
   
        Invoke-WmiMethod -Namespace "Root\CCM" -Class SMS_Client -Name ResetPolicy -ArgumentList 1 -ComputerName $textBox1.Text
    }

#get current user logged on machine
function Get-LoggedOnUser
{
     [CmdletBinding()]
     param
     (
         [Parameter()]
         [ValidateScript({ Test-Connection -ComputerName $_ -Quiet -Count 1 })]
         [ValidateNotNullOrEmpty()]
         [string[]]$ComputerName = $env:COMPUTERNAME
     )
     foreach ($comp in $ComputerName)
     {
         $output = (Get-WmiObject -Class win32_computersystem -ComputerName $comp).UserName
         $output
     }
 }

 #install selected app on remote machine
Function Invoke-AppInstall
{
		
		Param
		(
			[String][Parameter(Mandatory = $True, Position = 1)]
			$Computername,
			[String][Parameter(Mandatory = $True, Position = 2)]
			$AppName,
			[ValidateSet("Install", "Uninstall")]
			[String][Parameter(Mandatory = $True, Position = 3)]
			$Method
		)
		
		Begin
		{
			$Application = (Get-CimInstance -ClassName CCM_Application -Namespace "root\ccm\clientSDK" -ComputerName $Computername | Where-Object { $_.Name -like $AppName })
			
			$Args = @{
				EnforcePreference = [UINT32] 0
				Id = "$($Application.id)"
				IsMachineTarget = $Application.IsMachineTarget
				IsRebootIfNeeded = $False
				Priority = 'High'
				Revision = "$($Application.Revision)"
			}
			
		}
		
		Process
		{
			
			Invoke-CimMethod -Namespace "root\ccm\clientSDK" -ClassName CCM_Application -ComputerName $Computername -MethodName $Method -Arguments $Args
			
		}
		
		End { }
		
	}

#get pending reboot status of remote machine
Function Get-PendingRebootStatus 
{
<#
.Synopsis
    This will check to see if a server or computer has a reboot pending.
    For updated help and examples refer to -Online version.
 
.NOTES
    Name: Get-PendingRebootStatus
    Author: theSysadminChannel
    Version: 1.0
    DateCreated: 2018-Jun-6
 
.LINK
    https://thesysadminchannel.com/remotely-check-pending-reboot-status-powershell -
 
 
.PARAMETER ComputerName
    By default it will check the local computer.
 
.EXAMPLE
    Get-PendingRebootStatus -ComputerName PAC-DC01, PAC-WIN1001
 
    Description:
    Check the computers PAC-DC01 and PAC-WIN1001 if there are any pending reboots.
#>
 
    [CmdletBinding()]
    Param (
        [Parameter(
            Mandatory = $false,
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true,
            Position=0
        )]
 
    [string[]]  $ComputerName = $env:COMPUTERNAME
    )
 
 
    BEGIN {}
 
    PROCESS {
        Foreach ($Computer in $ComputerName) {
            Try {
                $PendingReboot = $false
 
                $HKLM = [UInt32] "0x80000002"
                $WMI_Reg = [WMIClass] "\\$Computer\root\default:StdRegProv"
 
                if ($WMI_Reg) {
                    if (($WMI_Reg.EnumKey($HKLM,"SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\")).sNames -contains 'RebootPending') {$PendingReboot = $true}
                    if (($WMI_Reg.EnumKey($HKLM,"SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\")).sNames -contains 'RebootRequired') {$PendingReboot = $true}
 
                    #Checking for SCCM namespace
                    $SCCM_Namespace = Get-WmiObject -Namespace ROOT\CCM\ClientSDK -List -ComputerName $Computer -ErrorAction Ignore
                    if ($SCCM_Namespace) {
                        if (([WmiClass]"\\$Computer\ROOT\CCM\ClientSDK:CCM_ClientUtilities").DetermineIfRebootPending().RebootPending -eq $true) {$PendingReboot = $true}
                    }
 
                    if ($PendingReboot -eq $true) {
                    [System.Windows.Forms.MessageBox]::Show('A reboot is pending on computer', 'Error')
                        [PSCustomObject]@{
                            ComputerName   = $Computer.ToUpper()
                            PendingReboot  = $true
                            
                        }
                      } else {
                      [System.Windows.Forms.MessageBox]::Show('No Reboot is pending', 'Error')
                        [PSCustomObject]@{
                            ComputerName   = $Computer.ToUpper()
                            PendingReboot  = $false
                            
                        }
                    }
                }
            } catch {
                Write-Error $_.Exception.Message
 
            } finally {
                #Clearing Variables
                $WMI_Reg        = $null
                $SCCM_Namespace = $null
            }
        }
    }
 
    END {}
}

#repair ccm client on remote machine
Function Start-CMClientRepair
{
    Try{
        Invoke-WmiMethod -Namespace "Root\CCM" -Class SMS_Client -Name RepairClient -ComputerName $textBox1.Text
    }
    Catch{
        $_.Exception.Message
    }
}

#uninstall ccmclient on remote machine
Function Remove-CMClient
{
    Invoke-Command -ComputerName $textbox1.text -ScriptBlock {Start-Process -Filepath "c:\windows\ccmsetup\ccmsetup.exe" -WorkingDirectory "c:\windows\ccmsetup" -Argumentlist "/Uninstall"}

    write-host $textbox1.text
    
}




#####################################################
#
# admin tab buttons
#
#####################################################

#run task button 
$Run_button5.add_click({
#if selected runs software inventory
            if ($radiobutton1.Checked)
{       $Computername = $Textbox1.Text     
        Invoke-WMIMethod -ComputerName $Computername -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000002}"

		[System.Windows.Forms.MessageBox]::Show('Software Inventory Now running', 'Error')
	    }  

            if ($radiobutton2.Checked) 
{$Computername = $Textbox1.Text     
        Invoke-WMIMethod -ComputerName $Computername -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000001}"
        [System.Windows.Forms.MessageBox]::Show('Hardware Inventory Now running', 'Error')
        }
           if ($radiobutton3.Checked) 
{        Reset-CMClientPolicy
        [System.Windows.Forms.MessageBox]::Show("Running Reset ConfigMgr Policies on $computername" , 'Error')
        }
           if ($radiobutton4.Checked) 
{       Start-CMClientRepair
        [System.Windows.Forms.MessageBox]::Show('Repair ConfigMgr Client', 'Error')
        }
           if ($radiobutton5.Checked) 
       {      $Computername = $Textbox1.Text
              [System.Windows.Forms.MessageBox]::Show("Please wait while CCM is removed from $computername", 'Error')
              Invoke-Command -ComputerName $Computername -ScriptBlock {Start-Process 'c:\windows\ccmsetup\ccmsetup.exe' -Argumentlist "/Uninstall" -Wait}
              [System.Windows.Forms.MessageBox]::Show("CCM is removed from $computername", 'Error')
        }
        
           if ($radiobutton6.Checked) 
{       $computername = $Textbox1.text
        $removecache = Invoke-Command -ComputerName $computername -ScriptBlock {Remove-Item "C:\Windows\ccmcache\*" -recurse -force}
        $removecache
        [System.Windows.Forms.MessageBox]::Show('CCMCache Folder has now been cleared', 'Error')
        }
           if ($radiobutton7.Checked) 
{        $Computername = $Textbox1.Text
        $user = Get-LoggedOnUser -ComputerName $Computername
        [System.Windows.Forms.MessageBox]::Show("$user", 'Error')
        }
        if ($radiobutton8.Checked) 
{      
    $Computername = $Textbox1.Text
    Get-PendingRebootStatus -ComputerName $computername}

    
})








#####################################################
#
# run the form 
#
#####################################################




$Form1.ShowDialog()






